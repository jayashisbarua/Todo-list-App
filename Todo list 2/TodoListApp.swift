//
//  TodoListApp.swift
//  TodoList
//
//  Created by Jayashis Barua on 02/01/25.
//

import SwiftUI

@main
struct TodoListApp: App {
    
    @StateObject var listviewmodel: ListViewModels = ListViewModels()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listviewmodel)
        }
    }
}
