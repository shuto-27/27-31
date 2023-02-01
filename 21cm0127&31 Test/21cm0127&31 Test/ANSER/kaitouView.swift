//
//  kaitouView.swift
//  21cm0127&31 Test
//
//  Created by cmStudent on 2023/01/17.
//
//ここの画面はNextViewの保存ボタンを押したときに表示する画面
//realmを試そうとしたらStoreの中身がないよと怒られました
//まずはNextViewからこの画面に遷移できて、この画面でメモを保存できるようにしたいです

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
