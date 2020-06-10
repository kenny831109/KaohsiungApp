//
//  ServiceCell.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/20.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class ServiceCell: UICollectionViewCell {
  
  let serviceCard: ServiceCard = {
    let card = ServiceCard()
    return card
  }()
  
  var service: MRTService! {
    didSet {
      serviceCard.title.text = service.title
      serviceCard.title.textColor = service.color
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(serviceCard)
    serviceCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7.5).isActive = true
    serviceCard.topAnchor.constraint(equalTo: topAnchor, constant: 7.5).isActive = true
    serviceCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7.5).isActive = true
    serviceCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7.5).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
