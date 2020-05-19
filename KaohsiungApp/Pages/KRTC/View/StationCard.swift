//
//  StationCard.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/19.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class StationCard: Card {
  let stationName_zh: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    return label
  }()
  
  let stationName_en: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    label.textColor = .lightGray
    return label
  }()
  
  let badge: StationBadge = {
    let badge = StationBadge()
    badge.layer.cornerRadius = 20
    return badge
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(stationName_zh)
    stationName_zh.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    stationName_zh.heightAnchor.constraint(equalToConstant: 20).isActive = true
    stationName_zh.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -2).isActive = true
    stationName_zh.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
    addSubview(stationName_en)
    stationName_en.leadingAnchor.constraint(equalTo: stationName_zh.leadingAnchor).isActive = true
    stationName_en.heightAnchor.constraint(equalToConstant: 20).isActive = true
    stationName_en.topAnchor.constraint(equalTo: centerYAnchor, constant: 2).isActive = true
    stationName_en.widthAnchor.constraint(lessThanOrEqualToConstant: 250).isActive = true
    addSubview(badge)
    badge.heightAnchor.constraint(equalToConstant: 40).isActive = true
    badge.widthAnchor.constraint(equalToConstant: 40).isActive = true
    badge.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    badge.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
