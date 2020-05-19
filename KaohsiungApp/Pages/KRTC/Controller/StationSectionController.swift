//
//  StationSectionController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/18.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import UIKit
import IGListKit

class StationSectionController: ListSectionController {
  
  var station: Station!
  
  override func sizeForItem(at index: Int) -> CGSize {
    return CGSize(width: collectionContext!.containerSize.width, height: 100)
  }
  
  override func cellForItem(at index: Int) -> UICollectionViewCell {
    let cell = collectionContext?.dequeueReusableCell(of: StationCell.self, for: self, at: index) as! StationCell
    cell.station = station
    return cell
  }
  
  override func numberOfItems() -> Int {
    return 1
  }
  
  override func didUpdate(to object: Any) {
    station = object as? Station
  }
  
  
  override func didHighlightItem(at index: Int) {
    UIView.animate(withDuration: 0.5) {
      if let cell = self.collectionContext?.cellForItem(at: index, sectionController: self) as? StationCell {
        cell.stationCard.transform = .init(scaleX: 0.95, y: 0.95)
      }
    }
  }
  
  override func didUnhighlightItem(at index: Int) {
    UIView.animate(withDuration: 0.5) {
      if let cell = self.collectionContext?.cellForItem(at: index, sectionController: self) as? StationCell {
        cell.stationCard.transform = .identity
      }
    }
  }
  
  override func didSelectItem(at index: Int) {
    let vc = StationLiveBoardController()
    vc.station = station
    let nav = CustomNavigationController(rootViewController: vc)
    nav.modalPresentationStyle = .fullScreen
    viewController?.present(nav, animated: true, completion: nil)
  }
}
