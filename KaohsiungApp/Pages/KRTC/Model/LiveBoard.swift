//
//  LiveBoard.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/19.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import Foundation

struct LiveBoard: Codable {
  let LineNO: String
  let LineID: String
  let LineName: StationNameType
  let StationID: String
  let StationName: StationNameType
  let TripHeadSign: String
  let DestinationStaionID: String
  let DestinationStationName: StationNameType
  let EstimateTime: Int
  let SrcUpdateTime: String
  let UpdateTime: String
}

extension LiveBoard {
  var updateTimeStr: String {
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssz"
    guard let date = dateformatter.date(from: SrcUpdateTime) else {return "error"}
    dateformatter.dateFormat = "yyyy.MM.dd HH:mm:ss"
    let dateStr = dateformatter.string(from: date)
    return "資料更新 \(dateStr)"
  }
}

