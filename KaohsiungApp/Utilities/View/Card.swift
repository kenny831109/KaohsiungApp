//
//  Card.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/15.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit


class Card: UIView {
  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .white
    translatesAutoresizingMaskIntoConstraints = false
    layer.shadowOffset = CGSize(width: 0, height: 0)
    layer.shadowRadius = 2
    layer.shadowOpacity = 0.2
    layer.cornerRadius = 5
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
