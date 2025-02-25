//
//  ListModel.swift
//  TodoList
//
//  Created by Jayashis Barua on 02/01/25.
//

import Foundation

// Immutable Struct

struct listModel: Identifiable, Codable {
    var id: String = UUID().uuidString
    let title: String
    let description: String
    let isCompleted: Bool
    
//    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
//        self.id = id
//        self.title = title
//        self.isCompleted = isCompleted
//    }
    
//    func update() -> listModel {
//        return listModel(id: id, title: title, isCompleted: !isCompleted)
//    }
}
