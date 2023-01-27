//
//  Item.swift
//  21cm0127&31 Test
//
//  Created by cmStudent on 2023/01/19.
//

import Foundation

struct Item: Identifiable {
  let id: String
  let title: String
  let order: Int
}

extension Item {
  init(itemDB: ItemDB) {
    id = itemDB.id
    title = itemDB.title
    order = itemDB.order
  }
}
