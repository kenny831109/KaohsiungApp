//
//  LaunchScreenController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/13.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class LaunchScreenController: UIViewController {
  
  let logo: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "KaohsiungCityLogo")
    imageView.alpha = 0
    return imageView
  }()
  
  let label_1: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "高"
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let label_2: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "雄"
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let label_3: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "市"
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let label_4: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "政"
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let label_5: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "府"
    label.textColor = .darkGray
    label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let ee_label: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "開"
//    label.textColor = .white
    label.font = UIFont.systemFont(ofSize: 40, weight: .medium)
    label.textAlignment = .center
    label.alpha = 0
    return label
  }()
  
  let copyright: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "本APP所取用資料為高雄市政府公開資料 \n https://www.ktec.gov.tw/"
    label.textColor = .lightGray
    label.textAlignment = .center
    label.numberOfLines = 0
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.alpha = 0
    return label
  }()
  
  var yAnchorConstant: CGFloat = -80
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    view.addSubview(logo)
    logo.heightAnchor.constraint(equalToConstant: 200).isActive = true
    logo.widthAnchor.constraint(equalToConstant: 200).isActive = true
    logo.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yAnchorConstant).isActive = true
    logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    view.addSubview(label_3)
    label_3.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    label_3.widthAnchor.constraint(equalToConstant: 40).isActive = true
    label_3.heightAnchor.constraint(equalToConstant: 44).isActive = true
    label_3.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 40).isActive = true
//    label_3.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yAnchorConstant).isActive = true
    view.addSubview(label_4)
    label_4.leadingAnchor.constraint(equalTo: label_3.trailingAnchor).isActive = true
    label_4.widthAnchor.constraint(equalToConstant: 40).isActive = true
    label_4.heightAnchor.constraint(equalToConstant: 44).isActive = true
    label_4.centerYAnchor.constraint(equalTo: label_3.centerYAnchor).isActive = true
    view.addSubview(label_5)
    label_5.leadingAnchor.constraint(equalTo: label_4.trailingAnchor).isActive = true
    label_5.widthAnchor.constraint(equalToConstant: 40).isActive = true
    label_5.heightAnchor.constraint(equalToConstant: 44).isActive = true
    label_5.centerYAnchor.constraint(equalTo: label_3.centerYAnchor).isActive = true
//    view.addSubview(ee_label)
//    ee_label.leadingAnchor.constraint(equalTo: m_label.trailingAnchor).isActive = true
//    ee_label.widthAnchor.constraint(equalToConstant: 40).isActive = true
//    ee_label.heightAnchor.constraint(equalToConstant: 44).isActive = true
//    ee_label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yAnchorConstant).isActive = true
    view.addSubview(label_2)
    label_2.trailingAnchor.constraint(equalTo: label_3.leadingAnchor).isActive = true
    label_2.widthAnchor.constraint(equalToConstant: 40).isActive = true
    label_2.heightAnchor.constraint(equalToConstant: 44).isActive = true
    label_2.centerYAnchor.constraint(equalTo: label_3.centerYAnchor).isActive = true
    view.addSubview(label_1)
    label_1.trailingAnchor.constraint(equalTo: label_2.leadingAnchor).isActive = true
    label_1.widthAnchor.constraint(equalToConstant: 40).isActive = true
    label_1.heightAnchor.constraint(equalToConstant: 44).isActive = true
    label_1.centerYAnchor.constraint(equalTo: label_3.centerYAnchor).isActive = true
    view.addSubview(copyright)
    copyright.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
    copyright.heightAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
    copyright.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
    copyright.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50).isActive = true
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    let animator = UIViewPropertyAnimator(duration:1.5, curve: .easeInOut) {
      self.logo.alpha = 1
      self.copyright.alpha = 1
      self.label_1.alpha = 1
      self.label_2.alpha = 1
      self.label_3.alpha = 1
      self.label_4.alpha = 1
      self.label_5.alpha = 1
//      self.ee_label.alpha = 1
    }
    animator.startAnimation()
    animator.addCompletion { (position) in
      UIView.animate(withDuration: 0.6, delay: 0, options: UIView.AnimationOptions(), animations: {
        self.copyright.alpha = 0
        self.label_1.alpha = 0
        self.label_1.center.y -= 10
      })
      UIView.animate(withDuration: 0.6, delay: 0.2, options: UIView.AnimationOptions(), animations: {
        self.label_2.alpha = 0
        self.label_2.center.y -= 10
      })
      UIView.animate(withDuration: 0.6, delay: 0.4, options: UIView.AnimationOptions(), animations: {
        self.label_3.alpha = 0
        self.label_3.center.y -= 10
      })
      UIView.animate(withDuration: 0.6, delay: 0.6, options: UIView.AnimationOptions(), animations: {
        self.label_4.alpha = 0
        self.label_4.center.y -= 10
      })
      UIView.animate(withDuration: 0.6, delay: 0.8, options: UIView.AnimationOptions(), animations: {
        self.label_5.alpha = 0
        self.label_5.center.y -= 10
      })
      UIView.animate(withDuration: 0.6, delay: 1, options: UIView.AnimationOptions(), animations: {
        self.logo.alpha = 0
        self.copyright.alpha = 0
      })
    }

  }
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .default
  }
  
}
