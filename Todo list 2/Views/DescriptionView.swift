//
//  DescriptionView.swift
//  Todo List
//
//  Created by Jayashis Barua on 03/01/25.
//

import SwiftUI

struct DescriptionView: View {
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                RoundedRectangle(cornerRadius: 30)
                    .frame(height: UIScreen.main.bounds.height / 2)
                    .transition(.asymmetric(
                        insertion: .move(edge: .bottom),
                        removal: .move(edge: .bottom)))
            }
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DescriptionView()
}
