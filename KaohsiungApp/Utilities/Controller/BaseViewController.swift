//
//  BaseViewController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/15.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit
import Lottie

class BaseViewController: UIViewController {
  
  private let loadingView: AnimationView = {
    let view = AnimationView(name: "Loading")
    view.translatesAutoresizingMaskIntoConstraints = false
    view.loopMode = .loop
    return view
  }()
  
  private let emptyDataView: EmptyDataView = {
    let view = EmptyDataView()
    return view
  }()
  
  var isLoading = false {
    didSet {
      isLoading ? loading() : removeLoadingView()
      tabBarController?.tabBar.items?.forEach({$0.isEnabled = !isLoading})
    }
  }
  
  var isEmptyData = false {
    didSet {
      isEmptyData ? showEmptyView() : removeEmptyView()
    }
  }
  
  weak var emptyViewDelegate: EmptyViewDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem = backItem
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    loadingView.play()
    emptyDataView.animationView.play()
  }
  
  func setupView() {
    view.backgroundColor = .white
    navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    navigationItem.backBarButtonItem = backItem
  }
  
  private func loading() {
    view.addSubview(loadingView)
    loadingView.heightAnchor.constraint(equalToConstant: 150).isActive = true
    loadingView.widthAnchor.constraint(equalToConstant: 150).isActive = true
    loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    loadingView.play()
  }
  
  private func removeLoadingView() {
    loadingView.removeFromSuperview()
  }
  
  private func showEmptyView() {
    view.addSubview(emptyDataView)
    emptyDataView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    emptyDataView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    emptyDataView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    emptyDataView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    emptyDataView.delegate = emptyViewDelegate
    emptyDataView.animationView.play()
  }
  
  private func removeEmptyView() {
    emptyDataView.removeFromSuperview()
  }
  
}
