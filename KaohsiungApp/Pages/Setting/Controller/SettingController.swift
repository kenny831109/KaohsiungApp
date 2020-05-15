//
//  SettingController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/15.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class SettingController: BaseViewController {
  
  let settingScrollView: UIScrollView = {
    let view = UIScrollView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    return view
  }()
  
  let generalCard: SettingCard = {
    let card = SettingCard()
    return card
  }()
  
  let versionCard: VersionCard = {
    let card = VersionCard()
    return card
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    navigationItem.title = "設定"
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.barTintColor = Color.navbarColor
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
  }
  
  override func setupView() {
    view.addSubview(settingScrollView)
    settingScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    settingScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    settingScrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    settingScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    settingScrollView.addSubview(generalCard)
    generalCard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    generalCard.topAnchor.constraint(equalTo: settingScrollView.topAnchor, constant: 15).isActive = true
    generalCard.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
    generalCard.heightAnchor.constraint(equalToConstant: 100).isActive = true
    settingScrollView.addSubview(versionCard)
    versionCard.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    versionCard.topAnchor.constraint(equalTo: generalCard.bottomAnchor, constant: 15).isActive = true
    versionCard.widthAnchor.constraint(equalToConstant: view.frame.width - 30).isActive = true
    versionCard.heightAnchor.constraint(equalToConstant: 50).isActive = true
  }
  
}
