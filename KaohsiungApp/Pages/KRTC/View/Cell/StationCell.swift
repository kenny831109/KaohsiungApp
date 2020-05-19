//
//  StationCell.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/18.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class StationCell: UICollectionViewCell {
  let stationCard: StationCard = {
    let card = StationCard()
    return card
  }()
  
  var station: Station! {
    didSet {
      stationCard.stationName_zh.text = station.StationName.Zh_tw
      stationCard.stationName_en.text = station.StationName.En
      stationCard.badge.backgroundColor = station.color
      stationCard.badge.title.text = station.StationID
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(stationCard)
    stationCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    stationCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    stationCard.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
    stationCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
