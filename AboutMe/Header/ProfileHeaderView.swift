//
//  ProfileHeaderView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 16/04/25.
//
import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        Image("pfp")
            .resizable()
            .scaledToFill()
            .frame(width: 100, height: 100)
            .clipShape(
                Circle()
                    .offset(y: -16)
            )
        
        Text("Rafael Venetikides")
            .font(.custom("Futura", size: 20))
        HStack{
            TagView(text: "Dev", color: .blue)
            TagView(text: "Memes", color: .green)
            TagView(text: "Games", color: .red)
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    ProfileHeaderView()
}
