//
//  TagView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 16/04/25.
//

import SwiftUI

struct TagView: View {
    let text: String
    let color: Color
    
    var body: some View {
        Text(text)
            .font(.caption)
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
            .background(color.opacity(0.2))
            .foregroundColor(color)
            .clipShape(Capsule())
    }
}

#Preview {
    HStack {
        TagView(text: "Dev", color: .blue)
        TagView(text: "Memes", color: Color(red: 0.09, green: 0.67, blue: 0.14))
        TagView(text: "Games", color: .red)

    }
    .preferredColorScheme(.light)
}
