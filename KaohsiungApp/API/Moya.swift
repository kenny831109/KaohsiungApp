//
//  Moya.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/12.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import Foundation
import Moya
import UIKit

enum ApiSevice {
  case BulletinBoard(_ offset: Int)
}

extension ApiSevice: TargetType {
  var baseURL: URL {
    return URL(string: "https://www.ktec.gov.tw")!
  }
  
  var path: String {
    return "/ktec_api.php"
  }
  
  var method: Moya.Method {
    return .get
  }
  
  var sampleData: Data {
    return Data()
  }
  
  var task: Task {
    switch self {
    case .BulletinBoard(let offset):
      let parameter = ["type": "json", "limit": 100, "offset": offset] as [String: Any]
      return .requestParameters(parameters: parameter, encoding: URLEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    return nil
  }
  
}
