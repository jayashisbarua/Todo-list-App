//
//  viewModels.swift
//  TodoList
//
//  Created by Jayashis Barua on 02/01/25.
//

import Foundation

/*
 CRUD functions
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModels: ObservableObject {
    
    @Published var items: [listModel] = [] {
        didSet {
            saveItem()
        }
    }
    
    let itemKey: String = "item_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
//        let newItems = [
//            listModel(title: "Buy groceries", isCompleted: false),
//            listModel(title: "Watch movie", isCompleted: true),
//            listModel(title: "Study for end sem", isCompleted: false),
//            listModel(title: "Go to gym", isCompleted: false),
//        ]
//        items.append(contentsOf: newItems)
        guard
            let previousData = UserDefaults.standard.data(forKey: itemKey),
            let decodedItems = try? JSONDecoder().decode([listModel].self, from: previousData)
        else { return }
        items = decodedItems
    }
    
    func deleteItems(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItems(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String, description: String) {
        items.append(listModel(title: title, description: description, isCompleted: false))
    }
    
    func updateItem(thing: listModel) {
        if let index = items.firstIndex(where: { $0.id == thing.id }) {
            items[index] = listModel(title: thing.title, description: thing.description, isCompleted: !thing.isCompleted)
        }
    }
    
    func saveItem() {
        if let encodedData = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(encodedData, forKey: itemKey)
        }
    }
    
}

//        if let index = items.firstIndex(where: { existingItem in
//            existingItem.id == item.id
//        }) {
//            // run this code
//        }

//            items[index] = listModel(title: item.title, isCompleted: !item.isCompleted)
