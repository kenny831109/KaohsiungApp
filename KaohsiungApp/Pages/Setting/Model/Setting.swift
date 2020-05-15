//
//  Setting.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/15.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

enum SettingType {
  case feedBack
}

struct Setting {
  
  let title: String
  let icon: UIImage?
  let type: SettingType
  
}

