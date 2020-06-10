//
//  ViewController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/7.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit
import IGListKit
import Lottie
import StoreKit

class BulletinController: BaseViewController {
  
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

  var offset = 0
  var totalPage = 0
  var fetchingMore = false
  var enrties = [Entries]()
  let apiManager = ApiManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
    let userDefault = UserDefaults()
    let count = userDefault.integer(forKey: "launchCount")
    if count == 5 {
      SKStoreReviewController.requestReview()
    }
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.barTintColor = Color.navbarColor
  }
  
  override func setupView() {
    navigationItem.title = "最新資訊"
    navigationController?.navigationBar.barTintColor = Color.navbarColor
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
//    navigationController?.navigationBar.tintColor = .white
    view.addSubview(listView)
    listView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    listView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    listView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    listView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    adapter.collectionView = listView
    adapter.dataSource = self
    adapter.scrollViewDelegate = self
    emptyViewDelegate = self
  }
  
  func loadData() {
    isLoading = true
    apiManager.getData(service: .BulletinBoard(offset)) { (model: BulletinModel?) in
      if let model = model {
        self.totalPage = model.paging.total
        self.enrties = model.entries
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
          self.isLoading = false
//          self.adapter.performUpdates(animated: true)
          self.adapter.reloadData(completion: nil)
          self.fetchingMore = false
        }
      }else {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
          self.isLoading = false
          self.isEmptyData = true
        }
      }
    }
  }
  
  func batchNewData() {
    if offset < totalPage {
      fetchingMore = true
      offset += 1
      loadData()
    }
  }

}

extension BulletinController: EmptyViewDelegate {
  func retry() {
    isEmptyData = false
    loadData()
  }
}

extension BulletinController: ListAdapterDataSource {
  func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
    return enrties
  }

  func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
    return BulletinSectionController()
  }

  func emptyView(for listAdapter: ListAdapter) -> UIView? {
    return nil
  }
}

extension BulletinController: UIScrollViewDelegate {
//  func scrollViewDidScroll(_ scrollView: UIScrollView) {
//    let offsetY = scrollView.contentOffset.y
//    let contentHeight = scrollView.contentSize.height
//    if offsetY > contentHeight - scrollView.frame.height {
//      if !fetchingMore {
//        batchNewData()
//      }
//    }
//  }
//  func scrollViewWillEndDragging(_ scrollView: UIScrollView,
//                                 withVelocity velocity: CGPoint,
//                                 targetContentOffset: UnsafeMutablePointer<CGPoint>) {
//
//    let distance = scrollView.contentSize.height - (targetContentOffset.pointee.y + scrollView.bounds.height)
//    if !fetchingMore && distance < 200 {
//        batchNewData()
//      fetchingMore = true
//      adapter.performUpdates(animated: true, completion: nil)
//      DispatchQueue.global(qos: .default).async {
//          // fake background loading task
//        sleep(2)
//        DispatchQueue.main.async {
//          self.fetchingMore = false
//          self.offset += 1
////          self.enrties.append(Entries(title: "Test", category: "", top: 1, publication_date: "", takendown_date: "", contents: "", id: "\(self.offset)", remark: "", links: [LinkModel](), files: [FileModel]()))
////          self.enrties.append(Entries(title: "Test", category: "", top: 1, publication_date: "", takendown_date: "", contents: "", id: "\(self.offset + 1)", remark: "", links: [LinkModel](), files: [FileModel]()))
//          self.adapter.performUpdates(animated: true, completion: nil)
//        }
//      }
//    }
//  }
}
