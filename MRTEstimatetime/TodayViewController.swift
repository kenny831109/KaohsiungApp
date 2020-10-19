//
//  TodayViewController.swift
//  MRTEstimatetime
//
//  Created by 逸唐陳 on 2020/6/10.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
  let label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "WoW"
    label.textColor = .white
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    extensionContext?.widgetLargestAvailableDisplayMode = .expanded
    view.addSubview(label)
    label.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    label.heightAnchor.constraint(equalToConstant: 20).isActive = true
    label.widthAnchor.constraint(equalToConstant: 150).isActive = true
  }
  
  func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
    switch activeDisplayMode {
    case .compact:
      preferredContentSize = CGSize(width: maxSize.width, height: 300)
    case .expanded:
      preferredContentSize = CGSize(width: maxSize.width, height: 500)
    @unknown default:
      fatalError("error")
    }
  }
      
  func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResult.Failed
    // If there's no update required, use NCUpdateResult.NoData
    // If there's an update, use NCUpdateResult.NewData
    
    completionHandler(NCUpdateResult.newData)
  }
    
}
