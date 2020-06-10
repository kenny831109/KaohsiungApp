//
//  LinkCell.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/15.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

protocol LinkCellDelegate: class {
  func didTap(_ link: URL)
}

class LinkCell: UITableViewCell {
  
  let linkBtn: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  var link: String = ""
  var title: String = "" {
    didSet {
      linkBtn.setTitle(title, for: .normal)
    }
  }
  
  weak var delegate: LinkCellDelegate?
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    backgroundColor = .white
    addSubview(linkBtn)
    linkBtn.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    linkBtn.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    linkBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
    linkBtn.widthAnchor.constraint(lessThanOrEqualToConstant: frame.width - 15).isActive = true
    linkBtn.addTarget(self, action: #selector(linkBtnHandler), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func linkBtnHandler() {
    guard let url = URL(string: link) else {return}
    delegate?.didTap(url)
  }
}
