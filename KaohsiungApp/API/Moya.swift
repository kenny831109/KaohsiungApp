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
import CryptoSwift

enum ApiSevice {
  case BulletinBoard(_ offset: Int)
  case GetMRTList(_ filter: String)
  case GetLiveBoard(_ stationID: String)
}

extension ApiSevice: TargetType {
  var baseURL: URL {
    switch self {
    case .BulletinBoard(_):
      return URL(string: "https://www.ktec.gov.tw")!
    case .GetMRTList(_), .GetLiveBoard(_):
      return URL(string: "https://ptx.transportdata.tw/MOTC/v2/Rail/Metro")!
    }
  }
  
  var path: String {
    switch self {
    case .BulletinBoard(_):
      return "/ktec_api.php"
    case .GetMRTList:
      return "/Station/KRTC"
    case .GetLiveBoard(_):
      return "/LiveBoard/KRTC"
    }
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
    case .GetMRTList(let keyword):
      let parameter = ["$format": "JSON",
                       "$filter": "contains(StationName/Zh_tw, '\(keyword)') or contains(StationName/En, '\(keyword)')"] as [String: Any]
      return .requestParameters(parameters: parameter, encoding: URLEncoding.default)
    case .GetLiveBoard(let stationID):
      let parameter = ["$format": "JSON",
                       "$filter": "StationID eq '\(stationID)'"] as [String: Any]
      return .requestParameters(parameters: parameter, encoding: URLEncoding.default)
    }
  }
  
  var headers: [String : String]? {
    switch self {
    case .GetMRTList(_), .GetLiveBoard(_):
      let appid = "80f21ba6534b44f498d7b4488212067e"
      let appKey = "lyPRSXmBKG3t7ZZs-cp_u2HSRNg"
      let dateFormater = DateFormatter()
      dateFormater.dateFormat = "EEE, dd MMM yyyy HH:mm:ww zzz"
      dateFormater.locale = Locale(identifier: "en_US")
      dateFormater.timeZone = TimeZone(secondsFromGMT: 0)
      let date = dateFormater.string(from: Date())
      let signDate = "x-date: " + date
      let base64 = try! HMAC(key: appKey, variant: .sha1).authenticate(signDate.bytes).toBase64()!
      let authorization: String = "hmac username=\""+appid+"\", algorithm=\"hmac-sha1\", headers=\"x-date\", signature=\""+base64+"\""
      return ["Authorization": authorization,
              "x-date": date,
              "Accept-Encoding": "gzip"]
    default:
      return nil
    }
  }
  
}
