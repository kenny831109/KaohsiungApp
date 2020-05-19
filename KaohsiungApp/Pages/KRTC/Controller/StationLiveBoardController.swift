//
//  StationLiveBoardController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/18.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit

class StationLiveBoardController: BaseViewController {
  
  var station: Station!
  let apimanager = ApiManager()
  var liveBoards = [LiveBoard]() {
    didSet {
      UIView.animate(withDuration: 1) {
        switch self.liveBoards.count {
        case 0:
          self.liveBoardCard_top.alpha = 0
          self.liveBoardCard_bot.alpha = 0
        case 1:
          self.liveBoardCard_top.alpha = 1
          self.liveBoardCard_bot.alpha = 0
          self.liveBoardCard_top.liveBoard = self.liveBoards[0]
          self.srcUpdateDate.text = self.liveBoards[0].updateTimeStr
        case 2:
          self.liveBoardCard_top.alpha = 1
          self.liveBoardCard_bot.alpha = 1
          self.liveBoardCard_top.liveBoard = self.liveBoards[0]
          self.liveBoardCard_bot.liveBoard = self.liveBoards[1]
          self.srcUpdateDate.text = self.liveBoards[0].updateTimeStr
        default:
          break
        }
      }
    }
  }
  
  let liveBoardCard_top: LiveBoardCard = {
    let card = LiveBoardCard()
    card.alpha = 0
    return card
  }()
  
  let liveBoardCard_bot: LiveBoardCard = {
    let card = LiveBoardCard()
    card.alpha = 0
    return card
  }()
  
  let srcUpdateDate: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 12, weight: .light)
    label.textColor = UIColor.lightGray
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    loadData()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.barTintColor = station.color
  }

  override func setupView() {
    view.backgroundColor = .white
    navigationController?.navigationBar.tintColor = .white
    navigationController?.navigationBar.barTintColor = station.color
    navigationItem.title = station.StationName.Zh_tw
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .done, target: self, action: #selector(back))
    emptyViewDelegate = self
    view.addSubview(srcUpdateDate)
    srcUpdateDate.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -5).isActive = true
    srcUpdateDate.heightAnchor.constraint(equalToConstant: 15).isActive = true
    srcUpdateDate.widthAnchor.constraint(lessThanOrEqualToConstant: 200).isActive = true
    srcUpdateDate.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    view.addSubview(liveBoardCard_top)
    liveBoardCard_top.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    liveBoardCard_top.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
    liveBoardCard_top.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    liveBoardCard_top.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -17.5).isActive = true
    view.addSubview(liveBoardCard_bot)
    liveBoardCard_bot.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
    liveBoardCard_bot.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -35).isActive = true
    liveBoardCard_bot.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    liveBoardCard_bot.topAnchor.constraint(equalTo: view.centerYAnchor, constant: 17.5).isActive = true
  }
  
  private func loadData() {
    isLoading = true
    apimanager.getData(service: .GetLiveBoard(station.StationID)) { (model: [LiveBoard]?) in
      if let model = model {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
          self.isLoading = false
          self.liveBoards = model
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

extension StationLiveBoardController {
  @objc func back() {
    dismiss(animated: true, completion: nil)
  }
}

extension StationLiveBoardController: EmptyViewDelegate {
  func retry() {
    loadData()
  }
}
