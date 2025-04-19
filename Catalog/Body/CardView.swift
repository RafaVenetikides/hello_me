//
//  CardView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 16/04/25.
//

import SwiftUI

struct CardView: View {
    let title: String
    let image: UIImage?
    var onTap: (() -> Void)? = nil
    
    @State private var isPressed = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8){
            if let uiImage = image {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140, height: 120)
            } else {
                RoundedRectangle(cornerRadius: 8)
                    .fill(.gray.opacity(0.3))
                    .frame(width: 140, height: 120)
                    .overlay(
                        Image(systemName: "photo")
                            .font(.system(size: 24))
                            .foregroundColor(.gray)
                    )
            }
            Text(title)
                .frame(width: 140, alignment: .leading)
                .foregroundColor(.white)
            }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isPressed ? Color.gray.opacity(0.35) : Color.gray.opacity(0.2))
        )
        .frame(width: 150, height: 165)
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onTapGesture {
            onTap?()
        }
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
        }
}

#Preview {
    CardView(title: "Meme Title", image: nil) {
        print("Card tapped!")
    }
    .preferredColorScheme(.dark)
    .background(Color.black)
}
