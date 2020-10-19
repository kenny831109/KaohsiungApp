//
//  StationListController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/18.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit
import IGListKit
import RxSwift
import RxCocoa

class StationListController: BaseViewController {
  lazy var adapter: ListAdapter = {
      return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 3)
  }()
  
  lazy var listView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    return view
  }()
  
  let apiManager = ApiManager()
  var stations = [Station]()
  var _stations = [Station]()
  var keyword = "" {
    didSet {
      queryData()
    }
  }
  var searchController: UISearchController!
  let disposebag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
    showAlert()
  }
  
  override func setupView() {
    navigationController?.navigationBar.barTintColor = Color.navbarColor
    navigationItem.title = "選擇站別"
    setupSearchController()
    view.addSubview(listView)
    listView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    listView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    listView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    listView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor).isActive = true
    adapter.collectionView = listView
    adapter.dataSource = self
    emptyViewDelegate = self
  }
  
  func setupSearchController() {
    if #available(iOS 13.0, *) {
      let appearance = UINavigationBarAppearance()
      appearance.backgroundColor = Color.navbarColor
      appearance.titleTextAttributes = [.foregroundColor : UIColor.white]
      navigationItem.standardAppearance = appearance
      navigationItem.scrollEdgeAppearance = appearance
    } else {
      // Fallback on earlier versions
    }
//    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).defaultTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(r: 74, g: 74, b: 74, a: 1)]
    searchController = UISearchController(searchResultsController: nil)
    searchController.dimsBackgroundDuringPresentation = false
    searchController.searchBar.tintColor = UIColor(r: 74, g: 74, b: 74, a: 1)
    if #available(iOS 13.0, *) {
      searchController.searchBar.searchTextField.backgroundColor = .white
    } else {
      // Fallback on earlier versions
    }
    if #available(iOS 13.0, *) {
      searchController.searchBar.searchTextField.tintColor = .systemBlue
    } else {
      // Fallback on earlier versions
    }
    searchController.searchBar.setTextColor(color: UIColor(r: 74, g: 74, b: 74, a: 1))
    if #available(iOS 13.0, *) {
      if let icon = searchController.searchBar.searchTextField.leftView as? UIImageView {
        icon.image = icon.image?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = UIColor(r: 74, g: 74, b: 74, a: 1)
      }
    } else {
      // Fallback on earlier versions
    }
//    searchController.searchBar.searchTextField
    searchController.searchBar.rx.text
      .orEmpty
      .throttle(.milliseconds(500), latest: true, scheduler: MainScheduler.instance)
      .distinctUntilChanged()
      .subscribe(onNext: { [weak self] query in
        guard let `self` = self else {return}
        self.keyword = query
    }).disposed(by: disposebag)
    navigationItem.searchController = searchController
  }
  
  func loadData() {
    isLoading = true
    StationData.sharedInstance.loadDatas() { result in
      switch result {
      case .success(let stations):
        self.stations = stations
        self._stations = stations
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
          self.isLoading = false
          self.adapter.performUpdates(animated: true)
        }
      case .failure(_):
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
          self.isLoading = false
          self.isEmptyData = true
        }
      }
    }
//    isLoading = true
//    apiManager.getData(service: .GetMRTList(keyword)) { (model: [Station]?) in
//      if let model = model {
//        self.stations = model
//        self._stations = model
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
//          self.isLoading = false
//          self.adapter.performUpdates(animated: true)
//        }
//      }else {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
//          self.isLoading = false
//          self.isEmptyData = true
//        }
//      }
//    }
  }
  
  func queryData() {
    _stations = stations.filter({ (station) -> Bool in
      guard let zh = station.StationName.Zh_tw, let en = station.StationName.En else {return false}
      if keyword == "" {
        _stations = stations
        return true
      }
      return zh.contains(keyword) || en.contains(keyword)
    })
    adapter.performUpdates(animated: true, completion: nil)
  }
  
  func showAlert() {
    let userDefault = UserDefaults()
    let stopShowAgain = userDefault.bool(forKey: "stopShowAgain")
    if !stopShowAgain {
      let alert = UIAlertController(title: "提醒", message: "App資料僅予以參考\n提醒您進入車站主體後，即請以車站內部系統顯示的動態資訊為主", preferredStyle: .alert)
      let understand = UIAlertAction(title: "了解", style: .cancel, handler: nil)
      let stopShow = UIAlertAction(title: "不再提醒", style: .default) { _ in
        userDefault.set(true, forKey: "stopShowAgain")
      }
      alert.addAction(understand)
      alert.addAction(stopShow)
      present(alert, animated: true, completion: nil)
    }
  }
}

extension StationListController: EmptyViewDelegate {
  func retry() {
    loadData()
  }
}

extension StationListController: ListAdapterDataSource {
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return _stations
  }
  
  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return StationSectionController()
  }
  
  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}
