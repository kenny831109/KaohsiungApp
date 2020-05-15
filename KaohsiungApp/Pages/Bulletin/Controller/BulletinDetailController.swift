//
//  BulletinDetailController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/14.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class BulletinDetailController: UIViewController {
  
  var entry: Entries!
  
  lazy var list: UITableView = {
    let view = UITableView(frame: .zero, style: .plain)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.tableFooterView = UIView()
    view.delegate = self
    view.dataSource = self
    view.separatorStyle = .none
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  func setupView() {
    view.backgroundColor = .white
    navigationController?.navigationBar.tintColor = .white
    navigationController?.navigationBar.barTintColor = entry.color
    navigationItem.title = entry.category.rawValue
    view.addSubview(list)
    list.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    list.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    list.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    list.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    list.register(cellType: HtmlContentCell.self)
    list.register(cellType: LinkCell.self)
  }
  
}

extension BulletinDetailController: UITableViewDelegate {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 3
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch indexPath.section {
    case 0:
      let size = CGSize(width: view.frame.width - 50, height: 2000)
      let height = entry.contents.convertHtml().boundingRect(with: size, options: .usesLineFragmentOrigin, context: nil).height
      return height + 20
    case 1:
      return entry.links.isEmpty ? 0 : 40
    case 2:
      return entry.files.isEmpty ? 0 : 40
    default:
      fatalError("error")
    }
  }
}
extension BulletinDetailController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1
    case 1:
      return entry.links.count
    case 2:
      return entry.files.count
    default:
      fatalError("error")
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch indexPath.section {
    case 0:
      let cell = tableView.dequeueReusableCell(with: HtmlContentCell.self, for: indexPath)
      cell.entry = entry
      return cell
    case 1:
      let cell = tableView.dequeueReusableCell(with: LinkCell.self, for: indexPath)
      cell.title = entry.links[indexPath.row].title
      cell.link = entry.links[indexPath.row].url
      cell.delegate = self
      return cell
    case 2:
      let cell = tableView.dequeueReusableCell(with: LinkCell.self, for: indexPath)
      cell.title = entry.files[indexPath.row].filename
      cell.link = entry.files[indexPath.row].url
      cell.delegate = self
      return cell
    default:
      fatalError("error")
    }
  }
}

extension BulletinDetailController: LinkCellDelegate {
  func didTap(_ link: URL) {
    UIApplication.shared.open(link)
  }
}
