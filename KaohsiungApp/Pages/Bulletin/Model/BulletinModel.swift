//
//  BulletinModel.swift
//  KaohsiungApp
//
//  Created by 逸唐陳 on 2020/5/12.
//  Copyright © 2020 逸唐陳. All rights reserved.
//

import Foundation
import IGListKit

enum CategoryType: String, Codable {
  case normal = "一般訊息"
  case mobilApplyService = "行動就服"
  case recruit = "求才相關"
  case jobSearch = "求職相關"
  case special = "特定對象"
  case vocationalTraining = "委外職訓"
  case other = "其他"
  case event = "就促活動"
  case news = "就業快報"
}

class BulletinModel: Codable {
  let paging: Paging
  let entries: [Entries]
}

class Paging: Codable {
  let limit: Int
  let offset: Int
  let total: Int
}

class Entries: Codable, ListDiffable {
  func diffIdentifier() -> NSObjectProtocol {
    return id as NSObjectProtocol
  }
  
  func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
    guard let object = object as? Entries else { return false }
    return id == object.id
  }
  
  let title: String
  let category: CategoryType
  let top: Int
  let publication_date: String
  let takendown_date: String
  let contents: String
  let remark: String?
  let id: String
  let links: [LinkModel]
  let files: [FileModel]
  
  init(title: String, category: CategoryType, top: Int, publication_date: String, takendown_date: String, contents: String, id: String, remark: String?, links: [LinkModel], files: [FileModel]) {
    self.title = title
    self.category = category
    self.top = top
    self.publication_date = publication_date
    self.takendown_date = takendown_date
    self.contents = contents
    self.id = id
    self.remark = remark
    self.links = links
    self.files = files
  }
}

extension Entries {
  var color: UIColor {
    switch category {
    case .event:
      return .green
    case .normal:
      return .cyan
    case .mobilApplyService:
      return .blue
    case .recruit:
      return .brown
    case .jobSearch:
      return .orange
    case .special:
      return .purple
    case .vocationalTraining:
      return .gray
    case .other:
      return .red
    case .news:
      return .yellow
    }
  }
  
  var attributeTitle: NSAttributedString {
    let paragraph = NSMutableParagraphStyle()
    paragraph.lineSpacing = 5
    paragraph.lineBreakMode = .byTruncatingTail
    let att = NSAttributedString(string: title, attributes: [.paragraphStyle : paragraph,
                                                             .font: UIFont.systemFont(ofSize: 16, weight: .regular)])
    return att
  }
}

class LinkModel: Codable {
  let title: String
  let url: String
}

class FileModel: Codable {
  let filename: String
  let url: String
}
