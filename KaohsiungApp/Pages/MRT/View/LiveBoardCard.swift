//
//  LiveBoardCard.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/19.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class LiveBoardCard: Card {
  
  let stationName_zh: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    label.text = "高雄國際機場"
    label.textColor = UIColor(r: 74, g: 74, b: 74, a: 1)
    return label
  }()
  
  let stationName_en: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    label.text = "Kaohsiung International Airport"
    label.textColor = .lightGray
    return label
  }()
  
  let arrow: UIImageView = {
    let view = UIImageView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.image = UIImage(named: "forward")
    return view
  }()
  
  let destination_zh: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    label.text = "小港"
    label.textColor = UIColor(r: 74, g: 74, b: 74, a: 1)
    return label
  }()
  
  let destination_en: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textAlignment = .center
    label.font = UIFont.systemFont(ofSize: 14, weight: .light)
    label.text = "Siaogang"
    label.textColor = .lightGray
    return label
  }()
  
  let estimateTimeTitle: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
    label.textAlignment = .center
//    label.textColor = UIColor.lightGray
    label.text = "預估到站時間: 3 分鐘"
    label.textColor = UIColor(r: 74, g: 74, b: 74, a: 1)
    return label
  }()
  
  var liveBoard: LiveBoard? {
    didSet {
      stationName_zh.text = liveBoard?.StationName.Zh_tw
      stationName_en.text = liveBoard?.StationName.En
      destination_zh.text = liveBoard?.DestinationStationName.Zh_tw
      destination_en.text = liveBoard?.DestinationStationName.En
      if let estimateTime = liveBoard?.EstimateTime {
        if estimateTime == 0 {
          estimateTimeTitle.text = "列車進站中..."
        }else {
          estimateTimeTitle.text = "預估到站時間: \(estimateTime) 分鐘"
        }
      }else {
        estimateTimeTitle.text = ""
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(stationName_zh)
    stationName_zh.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
    stationName_zh.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
    stationName_zh.heightAnchor.constraint(equalToConstant: 22).isActive = true
    stationName_zh.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    addSubview(stationName_en)
    stationName_en.topAnchor.constraint(equalTo: stationName_zh.bottomAnchor, constant: 2).isActive = true
    stationName_en.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    stationName_en.heightAnchor.constraint(equalToConstant: 18).isActive = true
    stationName_en.widthAnchor.constraint(equalTo: stationName_zh.widthAnchor).isActive = true
    addSubview(arrow)
    arrow.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    arrow.heightAnchor.constraint(equalToConstant: 35).isActive = true
    arrow.widthAnchor.constraint(equalToConstant: 35).isActive = true
    arrow.topAnchor.constraint(equalTo: stationName_en.bottomAnchor, constant: 20).isActive = true
    addSubview(destination_zh)
    destination_zh.topAnchor.constraint(equalTo: arrow.bottomAnchor, constant: 20).isActive = true
    destination_zh.widthAnchor.constraint(equalTo: widthAnchor, constant: -30).isActive = true
    destination_zh.heightAnchor.constraint(equalToConstant: 22).isActive = true
    destination_zh.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    addSubview(destination_en)
    destination_en.topAnchor.constraint(equalTo: destination_zh.bottomAnchor, constant: 2).isActive = true
    destination_en.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    destination_en.heightAnchor.constraint(equalToConstant: 18).isActive = true
    destination_en.widthAnchor.constraint(equalTo: destination_zh.widthAnchor).isActive = true
    addSubview(estimateTimeTitle)
    estimateTimeTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
    estimateTimeTitle.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
    estimateTimeTitle.topAnchor.constraint(equalTo: destination_en.bottomAnchor, constant: 20).isActive = true
    estimateTimeTitle.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20).isActive = true
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
