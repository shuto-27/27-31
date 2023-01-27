//
//  ItemDB.swift
//  21cm0127&31 Test
//
//  Created by cmStudent on 2023/01/19.
//

import Foundation
import RealmSwift

class ItemDB: Object {
  @objc dynamic var id = ""
  @objc dynamic var title = ""
  @objc dynamic var order = 0

  override class func primaryKey() -> String? {
    "id"
  }
}

