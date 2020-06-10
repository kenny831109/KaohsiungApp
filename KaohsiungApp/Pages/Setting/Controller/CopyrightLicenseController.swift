//
//  CopyrightLicenseController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/18.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class CopyrightLicenseController: BaseViewController {
  
  let licenseView: UITextView = {
    let view = UITextView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.textColor = .lightGray
    view.font = UIFont.systemFont(ofSize: 14, weight: .light)
    view.isEditable = false
    view.contentInset.left = 5
    view.contentInset.right = 5
    view.backgroundColor = .white
    return view
  }()
  
  var copyright: Copyright!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func setupView() {
    navigationItem.title = copyright.frameworkName
    view.addSubview(licenseView)
    licenseView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    licenseView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    licenseView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    licenseView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    guard let path = Bundle.main.path(forResource: copyright.licensePath, ofType: "txt") else {return}
    do {
      let text = try String(contentsOfFile: path)
      licenseView.text = text
    }catch {
      print(error)
    }
  }
  
}
