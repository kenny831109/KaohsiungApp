//
//  ApiManager.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/13.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import RxSwift
import Moya

struct ApiManager {
  let disposeBag = DisposeBag()
  func getData<T: Codable>(service: ApiSevice, completion: @escaping (T?) -> ()) {
    let provider = MoyaProvider<ApiSevice>()
    provider.rx.request(service).map(T.self).subscribe { (event) in
      switch event {
      case .success(let model):
        completion(model)
      case .error(let error):
        print(error)
        completion(nil)
      }
    }.disposed(by: disposeBag)
  }
}
