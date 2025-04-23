//
//  AboutMeView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 23/04/25.
//

import SwiftUI

struct AboutMeView: View {
    var body: some View {
        ZStack{
            Color(red: 0.96, green: 0.96, blue: 0.95)
                .ignoresSafeArea()
            VStack () {
                ProfileHeaderView()
                
                Divider()
                    .padding(.bottom, 8)
                
                VStack(alignment: .leading) {
                    Text("About Me")
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    Text(NSLocalizedString("About Me Description", comment: "Quick description of myself"))
                        .padding(.bottom, 16)
                    
                    Text("About Memes")
                        .font(.headline)
                        .padding(.bottom, 8)
                    
                    Text(NSLocalizedString("Memes", comment: "Why I choose to talk about memes"))
                        .padding(.bottom, 16)
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    AboutMeView()
        .preferredColorScheme(.dark)
}
