//
//  EmptyDataView.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/15.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit
import Lottie

protocol EmptyViewDelegate: class {
  func retry()
}

class EmptyDataView: UIView {
  
  let animationView: AnimationView = {
    let view = AnimationView(name: "Searching")
    view.translatesAutoresizingMaskIntoConstraints = false
    view.loopMode = .loop
    return view
  }()
  
  let oops: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .lightGray
    label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    label.text = "Oops! 找不到資料請稍後再試"
    return label
  }()
  
  let retryBtn: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .regular)
    button.setTitle("立即重試", for: .normal)
    return button
  }()
  
  weak var delegate: EmptyViewDelegate?
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(animationView)
    animationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
    animationView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    animationView.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -80).isActive = true
    animationView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
//    animationView.play()
    addSubview(oops)
    oops.topAnchor.constraint(equalTo: animationView.bottomAnchor, constant: 20).isActive = true
    oops.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    oops.heightAnchor.constraint(equalToConstant: 20).isActive = true
    oops.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
    addSubview(retryBtn)
    retryBtn.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    retryBtn.widthAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
    retryBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
    retryBtn.topAnchor.constraint(equalTo: oops.bottomAnchor, constant: 10).isActive = true
    retryBtn.addTarget(self, action: #selector(retryHandler), for: .touchUpInside)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  @objc func retryHandler() {
    delegate?.retry()
  }
}
