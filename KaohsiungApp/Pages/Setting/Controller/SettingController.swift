//
//  SettingController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/15.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit
import MessageUI

enum TransitionType {
  case push
  case present
}

protocol SettingRouterDelegate: class {
  func transition(to vc: UIViewController, transitionType: TransitionType)
}

class SettingController: BaseViewController {
  
  let settingScrollView: UIScrollView = {
    let view = UIScrollView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .white
    return view
  }()
  
  lazy var generalCard: SettingCard = {
    let card = SettingCard()
    card.delegate = self
    card.mailVC.mailComposeDelegate = self
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
    navigationController?.navigationBar.tintColor = .white
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

extension SettingController: SettingRouterDelegate {
  func transition(to vc: UIViewController, transitionType: TransitionType) {
    switch transitionType {
    case .present:
      present(vc, animated: true, completion: nil)
    case .push:
      navigationController?.pushViewController(vc, animated: true)
    }
  }
}

extension SettingController: MFMailComposeViewControllerDelegate {
  func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
    controller.dismiss(animated: true, completion: nil)
  }
}
