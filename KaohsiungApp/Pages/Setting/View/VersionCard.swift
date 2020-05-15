//
//  VersionCard.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/15.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class VersionCard: Card {
  
  var separator: UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(r: 234, g: 240, b: 245, a: 1)
    return view
  }
  
  let version: SettingContainer = {
    let versionString = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    let view = SettingContainer(UIImage(named: "version"), title: "版本資訊 \(versionString ?? "")")
    view.arrow.isHidden = true
    return view
  }()
  
  var rowHeight: CGFloat = 50
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(version)
    version.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    version.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    version.topAnchor.constraint(equalTo: topAnchor).isActive = true
    version.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
