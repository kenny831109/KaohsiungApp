//
//  KRTCListController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/18.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class KRTCListController: BaseViewController {
  
//  lazy var list
  
  let apiManager = ApiManager()
  var stations = [Station]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
  }
  
  override func setupView() {
    navigationController?.navigationBar.barTintColor = Color.navbarColor
    navigationItem.title = "選擇站別"
    emptyViewDelegate = self
  }
  
  func loadData() {
    isLoading = true
    apiManager.getData(service: .GetMRTList) { (model: [Station]?) in
      if let model = model {
        self.stations = model
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
          self.isLoading = false
        }
      }else {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
          self.isLoading = false
          self.isEmptyData = true
        }
      }
    }
  }
}

extension KRTCListController: EmptyViewDelegate {
  func retry() {
    loadData()
  }
}
