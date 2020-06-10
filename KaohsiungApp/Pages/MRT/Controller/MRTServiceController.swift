//
//  MRTServiceController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/20.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class MRTServiceController: BaseViewController {
  
  lazy var listView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.minimumInteritemSpacing = 0
    layout.minimumLineSpacing = 0
    let width = view.frame.width - 15
    layout.itemSize = CGSize(width: width, height: 60)
    layout.sectionInset = UIEdgeInsets(top: 7.5, left: 7.5, bottom: 7.5, right: 7.5)
    let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    view.delegate = self
    view.dataSource = self
    return view
  }()
  
  let service = [MRTService(title: "即時到站查詢", imageName: "", color: .systemBlue)]
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupView() {
    navigationController?.navigationBar.barTintColor = Color.navbarColor
    navigationItem.title = "服務項目"
    navigationController?.navigationBar.prefersLargeTitles = true
    view.addSubview(listView)
    listView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    listView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    listView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    listView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    listView.register(cellType: ServiceCell.self)
  }
}

extension MRTServiceController: UICollectionViewDelegate {}
extension MRTServiceController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return service.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(with: ServiceCell.self, for: indexPath)
    cell.service = service[indexPath.item]
    return cell
  }
}
