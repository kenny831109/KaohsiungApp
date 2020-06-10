//
//  UICollection+extension.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/20.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

extension UICollectionView {
    
  func register<T: UICollectionViewCell>(cellType: T.Type) {
    let className = cellType.className
    register(cellType, forCellWithReuseIdentifier: className)
  }
  
  func dequeueReusableCell<T: UICollectionViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
    return dequeueReusableCell(withReuseIdentifier: type.className, for: indexPath) as! T
  }
}
