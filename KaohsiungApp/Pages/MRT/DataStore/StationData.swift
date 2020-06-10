//
//  StationData.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/20.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import Foundation

enum StationDataError: Error {
    case emptyData
}

class StationData: NSObject {
    
  static let sharedInstance = StationData()
  
  private let internalQueue = DispatchQueue(label: "SingletionInternalQueue", qos: .default, attributes: .concurrent)
  private var _dataCount: Int = 0
  
  var stationData: [Station] = [Station]()
  
  private let apiManager = ApiManager()
  
  var dataCount: Int {
    get {
      return internalQueue.sync {
        _dataCount
      }
    }
      
    set(newValue) {
      // barrier flag => 告訴佇列，這個特定工作項目，必須在沒有其他平行執行的項目時執行
      internalQueue.async(flags: .barrier) {
        self._dataCount = newValue
      }
    }
  }
  
  private override init() {
    print("init...")
  }
  
  deinit {
    print("deinit...")
  }
  
  func loadDatas(completion: @escaping (Result<[Station], StationDataError>) -> ()) {
    apiManager.getData(service: .GetMRTList("")) { (model: [Station]?) in
      if let model = model {
        self.stationData = model
        completion(.success(self.stationData))
      }else {
        completion(.failure(.emptyData))
      }
    }
  }
}
