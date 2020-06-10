//
//  SearchBar+extension.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/6/10.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

extension UISearchBar {
  func setTextColor(color: UIColor) {
    UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self])
      .defaultTextAttributes = [.foregroundColor: color]
  }
}
