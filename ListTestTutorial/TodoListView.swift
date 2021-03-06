//
//  ContentView.swift
//  ListTestTutorial
//
//  Created by Oncu Ohancan on 27.04.2022.
//

import SwiftUI

struct TodoListView: View {
    
    @ObservedObject var todoManager: TodoListManager
    
    var body: some View {
        NavigationView {
            ZStack {
        List {
            ForEach(todoManager.items) { item in
                NavigationLink(
                    destination: Text("destination \(item.name)"),
            label: {
                    Text(item.name)
                })
            }
            .onDelete(perform: { indexSet in
                todoManager.delete(at: indexSet)
                })
            .onMove(perform: { indices, newOffset in
                todoManager.move(indices: indices, newOffset: newOffset)
            })
        }
                
                if todoManager.items.count == 0 {
                    Text("Please, start by adding items")
                        .foregroundColor(.gray)
                }
            }
            
        .navigationBarTitle(Text("Todo's"), displayMode: .large)
        .toolbar(content: {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                EditButton()
            
                Button(action: {
                    todoManager.addItem()
                }, label: {
                    Image(systemName: "plus")
                })
            }
         })
       }
    }
    }
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoManager: TodoListManager.emptyState())
            .previewDisplayName("emty state")
        TodoListView(todoManager: TodoListManager.fullState())
            .previewDisplayName("data exists")
    }
}
