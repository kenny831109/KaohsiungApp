//
//  Station.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/18.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import Foundation


struct Station: Codable {
  let StationUID: String
  let StationID: String
//  let StationName: StationNameType
//  let StationAddress: String
//  let BikeAllowOnHoliday: Bool
//  let StationPosition: StationPointType
}

struct StationNameType: Codable {
  let Zh_tw: String?
  let En: String?
}

struct StationPointType: Codable {
  let PositionLat: Double?
  let PositionLon: Double?
}
