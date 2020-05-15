//
//  NewsCard.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/14.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class NewsCard: Card {
  
  let icon: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  let category: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
    label.numberOfLines = 2
    return label
  }()
  
  let separator: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.layer.cornerRadius = 2
    return view
  }()
  
  let title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
    label.numberOfLines = 2
    return label
  }()
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.textAlignment = .right
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(category)
    category.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    category.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    category.heightAnchor.constraint(equalToConstant: 40).isActive = true
    category.widthAnchor.constraint(equalToConstant: 30).isActive = true
    addSubview(separator)
    separator.leadingAnchor.constraint(equalTo: category.trailingAnchor, constant: 10).isActive = true
    separator.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    separator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    separator.widthAnchor.constraint(equalToConstant: 2).isActive = true
    addSubview(title)
    title.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
    title.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    title.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 15).isActive = true
    title.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    addSubview(dateLabel)
    dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
    dateLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
    dateLabel.heightAnchor.constraint(equalToConstant: 14).isActive = true
    dateLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 10).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
