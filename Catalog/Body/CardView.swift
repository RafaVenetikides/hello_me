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
    let frameName: String?
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
                .font(.unnaRegular(16))
                .frame(width: 140, alignment: .leading)
                .foregroundColor(.black.opacity(0.7))
        }
        .padding(8)
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isPressed ? Color.gray.opacity(0.35) : Color.gray.opacity(0.2))
        )
        .frame(width: 150, height: 165)
        .overlay(Group {
            if let frameName = frameName {
                Image(frameName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 180)
                    .clipped()
            }
        })
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .onTapGesture {
            isPressed = true
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                isPressed = false
                onTap?()
            }
        }
        .onLongPressGesture(minimumDuration: 0.4) {
            isPressed = false
        }
    }
}

#Preview {
    CardView(
        title: "Artwork Name",
        image: UIImage(named: "bogos_binted"),
        frameName: "Frame1"
    ) {
        print("Card tapped!")
    }
    .preferredColorScheme(.light)
    .padding()
    CardView(
        title: "Artwork Name",
        image: UIImage(named: "bogos_binted"),
        frameName: "Frame2"
    ) {
        print("Card tapped!")
    }
    .preferredColorScheme(.light)
    .padding()
    CardView(
        title: "Artwork Name",
        image: UIImage(named: "bogos_binted"),
        frameName: "Frame3"
    ) {
        print("Card tapped!")
    }
    .preferredColorScheme(.light)
    .padding()
}
