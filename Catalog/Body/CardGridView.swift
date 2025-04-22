//
//  CardGridView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 16/04/25.
//
import SwiftUI

struct CardGridView: View {
    let memes: [MemeModel]
    let onSelect: (MemeModel) -> Void
    let onCreate: () -> Void
    let onDelete: (MemeModel) -> Void

    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(memes) { meme in
                CardView(
                    title: meme.title,
                    image: meme.image
                ) {
                    onSelect(meme)
                }
                .contextMenu {
                    Button(role: .destructive) {
                        onDelete(meme)
                    } label: {
                        Label("Excluir", systemImage: "trash")
                    }
                }
            }
            NewCardView(){
                onCreate()
            }
        }
        .padding(.horizontal)
    }
}
