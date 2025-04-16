//
//  CardGridView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 16/04/25.
//
import SwiftUI

struct CardGridView: View {
    let numberOfCards: Int

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(0..<numberOfCards, id: \.self) { index in
                CardView(
                    title: "Meme \(index + 1)",
                    imageName: "bogos_binted"
                )
            }
        }
        .padding(.horizontal)
    }
}

#Preview {
    CardGridView(numberOfCards: 4)
        .preferredColorScheme(.dark)
        .background(Color.black)
}
