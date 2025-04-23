//
//  NewCardView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 16/04/25.
//

import SwiftUI

struct NewCardView: View {
    var onTap: () -> Void = { }
    @State private var isPressed = false
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 12)
                .stroke(style: StrokeStyle(lineWidth: 2, dash: [6]))
                .foregroundColor(isPressed ? .gray.opacity(0.8) : .gray.opacity(0.5))
            
            Image(systemName: "plus")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(isPressed ? .gray.opacity(0.9) : .gray.opacity(0.6))
        }
        .frame(width: 150, height: 165)
        .contentShape(Rectangle())
        .scaleEffect(isPressed ? 0.95 : 1.0)
        .animation(.easeInOut(duration: 0.1), value: isPressed)
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in
                    isPressed = false
                    onTap()}
        )
    }
}

#Preview {
    NewCardView{print("New card tapped!")}
        .preferredColorScheme(.dark)
        .background(Color.black)
}
