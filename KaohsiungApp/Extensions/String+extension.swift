//
//  String+extension.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/14.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import Foundation

extension String {
  func convertHtml() -> NSAttributedString {
    let html = String(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(16); line-height: 1.5\">%@</span>", self)
    guard let data = html.data(using: .utf8) else { return NSAttributedString() }
    do{
      return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html,
                                                          .characterEncoding: String.Encoding.utf8.rawValue],
                                                documentAttributes: nil)
    }catch{
      return NSAttributedString()
    }
  }
}
