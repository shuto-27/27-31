//
//  ItemListView.swift
//  21cm0127&31 Test
//
//  Created by cmStudent on 2023/01/19.
//


import SwiftUI

struct ItemListView: View {
  @EnvironmentObject var store: ItemStore
  @State var title = ""
  var items: [Item]
  
  var body: some View {
    VStack {
      HStack {
//        Button("プリント", action: {store.printRealm()})
        EditButton()
      }
      .padding(.top)
      
      HStack {
        TextField("タイトルの入力", text: $title)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        Button("決定", action: create)
      }
      .padding(.leading)
      .padding(.trailing)
      
      List {
        ForEach(items) { item in
          HStack {
            Text(item.title)
            Spacer()
            Text("order:\(item.order)")
          }
        }
        .onDelete { offsets in
          delete(offsets: offsets)
        }
        .onMove { source, destination in
          move(sourceIndexSet: source, destination: destination)
//          print("source:      \(source.first!)")
//          print("destination: \(destination)")
        }
      }
    }
  }
}

extension ItemListView {
  private func create() {
    store.create(title: self.title, order: items.count)
    self.title = ""
  }
  
  private func delete(offsets: IndexSet) {
    guard let index = offsets.first else {
      return
    }
    let deleteId = items[index].id
    let deleteOrder = items[index].order
    for i in (deleteOrder + 1)..<items.count {
      store.update(id: items[i].id, order: items[i].order - 1)
    }
    store.delete(id: deleteId)
  }
  
  private func move(sourceIndexSet: IndexSet, destination: Int) {
    store.move(sourceIndexSet: sourceIndexSet, destination: destination)
  }
}

struct ItemListView_Previews: PreviewProvider {
  static var previews: some View {
    ItemListView(items: ItemMock.itemMock)
  }
}
