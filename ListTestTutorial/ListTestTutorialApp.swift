//
//  ListTestTutorialApp.swift
//  ListTestTutorial
//
//  Created by Oncu Ohancan on 27.04.2022.
//

import SwiftUI

@main

struct ListTestTutorialApp: App {
    
    @StateObject var todoManager = TodoListManager()
    var body: some Scene {
        WindowGroup {
            TodoListView(todoManager: todoManager)
        }
    }
}
