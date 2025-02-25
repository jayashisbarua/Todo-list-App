//
//  NoItemsView.swift
//  TodoList
//
//  Created by Jayashis Barua on 02/01/25.
//

import SwiftUI

struct NoItemsView: View {
    
    @State var animate: Bool = false
    
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            Text("There are no items yet!")
                .font(.title)
                .fontWeight(.semibold)
            VStack {
                Text("Are you a productive person?")
                    .fontWeight(.semibold)
                Text("Then you should click the Add button and add a bunch of item to your todo list !")
            }
            .padding(.bottom, 20)
            NavigationLink {
                AddView()
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 40))
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(40)
            }
            .shadow(
                color: .blue.opacity(0.5),
                radius: animate ? 20 : 10,
                x: 0,
                y: animate ? 30 : 10
            )
            .scaleEffect(animate ? 1 : 1)
            .offset(y: animate ? -10 : 0)
            Spacer()
            Spacer()
        }
        .multilineTextAlignment(.center)
        .padding(40)
        .onAppear(perform: addAnimation)
    }
    
    func addAnimation() {
        guard !animate else { return }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation(
                Animation
                    .easeInOut(duration: 1)
                    .repeatForever()
            ) {
                animate.toggle()
            }
        }
    }
}

#Preview {
    NavigationView {
        NoItemsView()
            .navigationTitle("Todo List 📝")
    }
}
