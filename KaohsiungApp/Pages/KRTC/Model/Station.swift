//
//  Station.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/18.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import Foundation
import IGListDiffKit


class Station: Codable, ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return StationID as NSObjectProtocol
  }
  
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard let object = object as? Station else { return false }
    return StationID == object.StationID
  }
  
  let StationUID: String
  let StationID: String
  let StationName: StationNameType
  let StationAddress: String
  let BikeAllowOnHoliday: Bool
  let StationPosition: StationPointType
}

extension Station {
  var color: UIColor {
    if StationID.first == "R" {
      return UIColor(r: 223, g: 12, b: 89, a: 1)
    }else {
      return UIColor(r: 255, g: 138, b: 0, a: 1)
    }
  }
}

class StationNameType: Codable {
  let Zh_tw: String?
  let En: String?
}

class StationPointType: Codable {
  let PositionLat: Double?
  let PositionLon: Double?
}
