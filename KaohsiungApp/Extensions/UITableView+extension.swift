//
//  UITableView+extension.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/13.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

public protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

public extension ClassNameProtocol {
  static var className: String {
    return String(describing: self)
  }

  var className: String {
    return type(of: self).className
  }
}

extension NSObject: ClassNameProtocol {}

public extension UITableView {
  func register<T: UITableViewCell>(cellType: T.Type) {
    let className = cellType.className
    register(cellType, forCellReuseIdentifier: className)
  }

  func register<T: UITableViewHeaderFooterView>(reuseView: T.Type) {
    register(reuseView, forHeaderFooterViewReuseIdentifier: reuseView.className)
  }
  
  func dequeueReusableView<T: UITableViewHeaderFooterView>(with type: T.Type) -> T {
    return self.dequeueReusableHeaderFooterView(withIdentifier: type.className) as! T
  }

  func dequeueReusableCell<T: UITableViewCell>(with type: T.Type, for indexPath: IndexPath) -> T {
    return self.dequeueReusableCell(withIdentifier: type.className, for: indexPath) as! T
  }
  
}
