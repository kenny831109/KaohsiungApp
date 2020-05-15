//
//  BulletinCell.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/12.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class BulletinCell: UICollectionViewCell {
  
  let newsCard: NewsCard = {
    let card = NewsCard()
    return card
  }()
  
  var entry: Entries! {
    didSet {
      newsCard.title.attributedText = entry.attributeTitle
      newsCard.category.text = entry.category.rawValue
      newsCard.separator.backgroundColor = entry.color
      newsCard.dateLabel.text = "\(entry.publication_date) ～ \(entry.takendown_date)"
    }
  }
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(newsCard)
    newsCard.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    newsCard.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    newsCard.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    newsCard.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
