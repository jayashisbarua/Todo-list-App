//
//  ListView.swift
//  TodoList
//
//  Created by Jayashis Barua on 02/01/25.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listviewmodel: ListViewModels
    @State var showDescription: Bool = false
    @State var textis: String = ""
    @State var completed: Bool = false
    @State var descriptionColorfalse: Color = Color("descriptionColorFalse")
    @State var descriptionColortrue: Color = Color("descriptionColorTrue")
    
    var body: some View {
        ZStack {
            VStack {
                if listviewmodel.items.isEmpty {
                    NoItemsView()
                        .transition(AnyTransition.opacity.animation(.easeInOut(duration: 0.5)))
                } else {
                    List {
                        ForEach(listviewmodel.items) { item in
                            ListRowView(items: item)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        showDescription.toggle()
                                    }
                                    textis = item.description
                                    completed = item.isCompleted
                                }
                        }
                        .onDelete(perform: listviewmodel.deleteItems)
                        .onMove(perform: listviewmodel.moveItems)
                    }
                    .listStyle(PlainListStyle())
                }
                Spacer()
                if showDescription {
                    descriptionView(showDescription: $showDescription, text: $textis, completed: $completed, descriptionColortrue: $descriptionColortrue, descriptionColorfalse: $descriptionColorfalse)
                }
            }
        }
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
            leading:
                EditButton()
                    .fontWeight(.bold),
            trailing:
                NavigationLink("Add", destination: AddView())
                .fontWeight(.bold)
        )
        .ignoresSafeArea(edges: .bottom)
    }
}

struct descriptionView: View {
    
    @Binding var showDescription: Bool
    @Binding var text: String
    @Binding var completed: Bool
    @Binding var descriptionColortrue: Color
    @Binding var descriptionColorfalse: Color
    
    var body: some View {
        VStack {
            Spacer()
            
            VStack {
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 50, height: 5)
                    .padding()
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: 300)
            .background(.ultraThickMaterial)
            .cornerRadius(30)
            .overlay(
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Text("Description")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.primary.opacity(0.7))
                            .padding(.leading, 30)
                            .padding(.top, 40)
                        Spacer()
                        Image(systemName: "xmark")
                            .font(.title2)
                            .padding(.trailing, 30)
                            .padding(.top, 40)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    showDescription.toggle()
                                }
                            }
                    }
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundStyle(completed ? descriptionColortrue : descriptionColorfalse)
                        .overlay(
                            VStack(alignment: .leading) {
                                HStack {
                                    Text(text)
                                        .foregroundStyle(.primary.opacity(0.6))
                                        .padding()
                                    Spacer()
                                }
                                Spacer()
                            }
                                .multilineTextAlignment(.leading)
                        )
                        .padding(.horizontal, 30)
                        .padding(.bottom, 70)
                }
            )
        }
        .transition(AnyTransition.move(edge: .bottom))
    }
}

#Preview {
    NavigationView {
        ListView()
    }
    .environmentObject(ListViewModels())
}
