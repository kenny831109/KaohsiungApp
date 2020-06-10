//
//  ServiceCard.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/20.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class ServiceCard: Card {
  
  let title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
    label.textAlignment = .center
    label.numberOfLines = 2
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(title)
    title.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
    title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
