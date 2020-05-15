//
//  SettingCard.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/15.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class SettingCard: Card {
  
  var separator: UIView {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = UIColor(r: 234, g: 240, b: 245, a: 1)
    return view
  }
  
  let feedback: SettingContainer = {
    let view = SettingContainer(UIImage(named: "feedback"), title: "意見回饋")
    return view
  }()
  
  let copyright: SettingContainer = {
    let view = SettingContainer(UIImage(named: "copyright"), title: "著作權聲明")
    return view
  }()
  
  var rowHeight: CGFloat = 50
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(feedback)
    feedback.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    feedback.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    feedback.topAnchor.constraint(equalTo: topAnchor).isActive = true
    feedback.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
    let separator1 = separator
    addSubview(separator1)
    separator1.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    separator1.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    separator1.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
    separator1.topAnchor.constraint(equalTo: feedback.bottomAnchor).isActive = true
    addSubview(copyright)
    copyright.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    copyright.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    copyright.topAnchor.constraint(equalTo: feedback.bottomAnchor).isActive = true
    copyright.heightAnchor.constraint(equalToConstant: rowHeight).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
