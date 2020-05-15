//
//  SettingContainer.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/15.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class SettingContainer: UIView {
  
  let iconView: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let titleLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let arrow: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.image = UIImage(named: "arrow")
    return view
  }()
  
  init(_ icon: UIImage?, title: String) {
    super.init(frame: .zero)
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(iconView)
    iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    iconView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    iconView.widthAnchor.constraint(equalToConstant: 20).isActive = true
    iconView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    addSubview(titleLabel)
    titleLabel.leadingAnchor.constraint(equalTo: iconView.trailingAnchor, constant: 15).isActive = true
    titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    addSubview(arrow)
    arrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    arrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
    arrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
    arrow.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    iconView.image = icon
    titleLabel.text = title
  }
  
//  override init(frame: CGRect) {
//    super.init(frame: frame)
//  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
