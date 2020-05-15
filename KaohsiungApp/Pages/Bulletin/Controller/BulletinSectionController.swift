//
//  BulletinSectionController.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/13.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import IGListKit

class BulletinSectionController: ListSectionController {
  var enrty: Entries!
  
  override func numberOfItems() -> Int {
    return 1
  }
  
  override func sizeForItem(at index: Int) -> CGSize {
      return CGSize(width: collectionContext!.containerSize.width, height: 120)
  }
  
  override func cellForItem(at index: Int) -> UICollectionViewCell {
    let cell = collectionContext?.dequeueReusableCell(of: BulletinCell.self, for: self, at: index) as! BulletinCell
    cell.entry = enrty
    return cell
  }
  
  override func didUpdate(to object: Any) {
    enrty = object as? Entries
  }
  
  override func didSelectItem(at index: Int) {
    let vc = BulletinDetailController()
    vc.entry = enrty
    viewController?.navigationController?.pushViewController(vc, animated: true)
  }
}
