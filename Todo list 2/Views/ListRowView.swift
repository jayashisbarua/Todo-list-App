//
//  ListRowView.swift
//  TodoList
//
//  Created by Jayashis Barua on 02/01/25.
//

import SwiftUI

struct ListRowView: View {
    
    @EnvironmentObject var listviewmodel: ListViewModels
    @State var items: listModel
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: items.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundStyle(items.isCompleted ? Color.green : Color.red)
                .font(.title)
                .onTapGesture {
                    withAnimation(.linear) {
                        listviewmodel.updateItem(thing: items)
                    }
                }
            Text(items.title)
                .font(.title2)
            Spacer()
        }
        .padding(.vertical, 8)
    }
}

var item1 = listModel(title: "Item 1", description: "Description 1", isCompleted: false)
var item2 = listModel(title: "Item 2", description: "Description 2", isCompleted: true)
#Preview {
    Group {
        ListRowView(items: item1)
        ListRowView(items: item2)
    }
}
