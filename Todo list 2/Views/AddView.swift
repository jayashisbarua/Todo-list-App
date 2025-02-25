//
//  AddView.swift
//  TodoList
//
//  Created by Jayashis Barua on 02/01/25.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listviewmodel: ListViewModels
    @State var textFieldText: String = ""
    @State var descriptionText: String = ""
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20.0) {
                HStack {
                    Text("Add a heading")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                }
                TextField("add something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.secondary.opacity(0.3))
                    .cornerRadius(10)
                HStack {
                    Text("Add a description")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                }
//                TextField(text: $descriptionText) {
//                    Text("HIHIHIHI")
//                }
//                .padding(.horizontal)
//                .frame(height: 150.0)
//                .background(Color.secondary.opacity(0.3))
//                .cornerRadius(10)
                TextField("add description here...", text: $descriptionText)
                    .padding(.horizontal)
                    .frame(height: 150.0)
                    .background(Color.secondary.opacity(0.3))
                    .cornerRadius(10)
                Button(action: {
                    if textIsAppropriate() {
                        listviewmodel.addItem(title: textFieldText, description: descriptionText)
                        presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Text("save".uppercased())
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
            }
            .multilineTextAlignment(.leading)
            .padding(14)
        }
        .navigationTitle("Add an item 🖋️")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "The Todo item must be at least 3 characters long! 🙏🏻"
            showAlert.toggle()
            return false
        }
        if descriptionText.count < 5 {
            alertTitle = "The description must be at least 5 characters long! ☺️"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

#Preview {
    NavigationView {
        AddView()
    }
    .environmentObject(ListViewModels())
}
