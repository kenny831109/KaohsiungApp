//
//  HtmlContentCell.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/14.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class HtmlContentCell: UITableViewCell {
  
  let textView: UITextView = {
    let textView = UITextView()
    textView.translatesAutoresizingMaskIntoConstraints = false
    textView.isEditable = false
    textView.bounces = false
    textView.contentInset.left = 15
    textView.contentInset.right = 15
    textView.dataDetectorTypes = .all
    return textView
  }()
  
  var entry: Entries! {
    didSet {
      textView.attributedText = entry.contents.convertHtml()
    }
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    selectionStyle = .none
    addSubview(textView)
    textView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
    textView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    textView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    textView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
