//
//  CopyrightListController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/18.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class CopyrightListController: BaseViewController {
  
  let copyrights = [Copyright(frameworkName: "AlamoFire", licensePath: "Alamofire_license"),
                    Copyright(frameworkName: "RxSwift", licensePath: "RxSwift_license"),
                    Copyright(frameworkName: "Kingfisher", licensePath: "Kingfisher_license"),
                    Copyright(frameworkName: "IGListKit", licensePath: "IGListKit_license"),
                    Copyright(frameworkName: "Moya", licensePath: "Moya_license"),
                    Copyright(frameworkName: "Lottie-ios", licensePath: "lottie_license"),
                    Copyright(frameworkName: "CryptoSwift", licensePath: "CryptoSwift_license")]
  lazy var list: UITableView = {
    let view = UITableView(frame: .zero, style: .plain)
    view.translatesAutoresizingMaskIntoConstraints = false
    view.tableFooterView = UIView()
    view.delegate = self
    view.dataSource = self
    view.backgroundColor = .white
    return view
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupView() {
    navigationItem.title = "著作權聲明"
    view.addSubview(list)
    list.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    list.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    list.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    list.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    list.register(cellType: UITableViewCell.self)
  }
}

extension CopyrightListController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let vc = CopyrightLicenseController()
    vc.copyright = copyrights[indexPath.row]
    navigationController?.pushViewController(vc, animated: true)
  }
}
extension CopyrightListController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return copyrights.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(with: UITableViewCell.self, for: indexPath)
    cell.textLabel?.text = copyrights[indexPath.row].frameworkName
    cell.textLabel?.textColor = UIColor(r: 74, g: 74, b: 74, a: 1)
    cell.accessoryType = .disclosureIndicator
    cell.backgroundColor = .white
    return cell
  }
}
