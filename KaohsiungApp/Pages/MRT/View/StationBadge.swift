//
//  StationBadge.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/18.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class StationBadge: UIView {
  
  let title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
    label.textColor = .white
    label.textAlignment = .center
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(title)
    title.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    title.heightAnchor.constraint(equalToConstant: 14).isActive = true
    title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
    title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5).isActive = true
  }
  
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
