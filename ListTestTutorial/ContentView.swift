//
//  ContentView.swift
//  ListTestTutorial
//
//  Created by Oncu Ohancan on 27.04.2022.
//

import SwiftUI

struct Item: Identifiable {
    var id: UUID
    var name: String
}

struct ContentView: View {
    
   @State var items = [Item(id: UUID(), name: "first"), Item(id: UUID(), name: "second"), Item(id: UUID(), name: "third")]
    var body: some View {
        List {
            ForEach(items) { item in
                Text(item.name)
            }
            .onDelete(perform: { indexSet in
                for index in indexSet {
                    items.remove(at: index)
                }
                
            })
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
