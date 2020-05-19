//
//  TabBarController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/13.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
  override func viewDidLoad() {
    UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: Color.tabBarDefaultColor], for: .normal)
    UITabBarItem.appearance().setTitleTextAttributes([.foregroundColor: Color.tabBarSeletedColor], for: .selected)
    UITabBar.appearance().barTintColor = .white
    
    let bulletinVC = BulletinController()
    bulletinVC.tabBarItem.title = "市府資訊"
    bulletinVC.tabBarItem.image = #imageLiteral(resourceName: "newspaper-n").withRenderingMode(.alwaysOriginal)
    bulletinVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "newspaper-h").withRenderingMode(.alwaysOriginal)
    
    let krtcVC = KRTCListController()
    krtcVC.tabBarItem.title = "捷運資訊"
    krtcVC.tabBarItem.image = #imageLiteral(resourceName: "mrt-n").withRenderingMode(.alwaysOriginal)
    krtcVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "mrt-h").withRenderingMode(.alwaysOriginal)
    
    let settingVC = SettingController()
    settingVC.tabBarItem.title = "設定"
    settingVC.tabBarItem.image = #imageLiteral(resourceName: "setting-n").withRenderingMode(.alwaysOriginal)
    settingVC.tabBarItem.selectedImage = #imageLiteral(resourceName: "setting-h").withRenderingMode(.alwaysOriginal)
    
    let navigationControllers = [bulletinVC, krtcVC, settingVC].map({ CustomNavigationController(rootViewController: $0) })
    viewControllers = navigationControllers
  }
}
