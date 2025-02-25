//
//  ListRowView.swift
//  TodoList
//
//  Created by Jayashis Barua on 02/01/25.
//

import SwiftUI

struct test: View {
    
    @State var items: listModel
    @State var showDescription: Bool = false
    
    var body: some View {
        ZStack {
//            Color.green.edgesIgnoringSafeArea(.all)
            VStack {
                HStack(alignment: .center) {
                    Image(systemName: items.isCompleted ? "checkmark.circle.fill" : "circle")
                        .foregroundStyle(items.isCompleted ? Color.green : Color.red)
                        .font(.title)
                    Text(items.title)
                        .font(.title2)
                    Spacer()
                }
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showDescription.toggle()
                    }
                }
                .padding(.vertical, 8)
                Spacer()
//                if showDescription {
//                    RoundedRectangle(cornerRadius: 30)
//                        .frame(height: UIScreen.main.bounds.height * 0.5)
//                        .transition(.asymmetric(
//                            insertion: .move(edge: .bottom),
//                            removal: .move(edge: .bottom)
//                        ))
//                        .animation(.easeInOut)
//                }
                if showDescription {
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
                                HStack {
                                    Text("Description")
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                        .foregroundStyle(.primary.opacity(0.7))
                                        .padding(.leading, 30)
                                        .padding(.top, 40)
                                    Spacer()
                                }
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundStyle(.gray.opacity(0.1))
                                    .overlay(
                                        VStack(alignment: .leading) {
                                            Text("The descroption will be here we can type anythiing here and save as description")
                                                .foregroundStyle(.black.opacity(0.6))
                                                .padding(.top, 20)
                                            Spacer()
                                        }
                                            .multilineTextAlignment(.leading)
                                    )
                                    .padding(.horizontal, 25)
                                    .padding(.bottom, 70)
                            }
                        )
                    }
                    .transition(AnyTransition.move(edge: .bottom))
                }
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

var item4 = listModel(title: "Item 1", description: "description 4", isCompleted: false)
var item5 = listModel(title: "Item 2", description: "description 5", isCompleted: true)
#Preview {
    Group {
        test(items: item4)
//        test(items: item5)
    }
}
