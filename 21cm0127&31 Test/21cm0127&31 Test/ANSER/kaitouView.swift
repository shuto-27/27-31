//
//  kaitouView.swift
//  21cm0127&31 Test
//
//  Created by cmStudent on 2023/01/17.
//


import SwiftUI

struct kaitouView: View {
  @EnvironmentObject var store: ItemStore
  
  var body: some View {
    ItemListView(items: store.items)
  }
}

struct kaitouView_Previews: PreviewProvider {
  static var previews: some View {
    kaitouView()
  }
}
