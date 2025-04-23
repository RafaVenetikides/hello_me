//
//  DetailsView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 16/04/25.
//

import SwiftUI

struct DetailsView: View {
    let meme: MemeModel
    
    var body: some View {
        
        VStack (alignment: .leading){
            Text(meme.title)
                .padding(.top)
                .padding(.horizontal)
                .font(.custom("Futura", size: 30))
                .foregroundColor(.black)
            
            HStack{
                Spacer()
                Rectangle()
                    .frame(width: 370 ,height: 1)
                    .foregroundStyle(.black)
                    .padding(.bottom, -16)
                Spacer()
            }
            
            ScrollView{
                VStack(spacing: 20){
                    if let image = meme.image {
                        Image(uiImage: image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                    } else {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.gray.opacity(0.3))
                            .frame(height: 150)
                            .overlay(
                                Image(systemName: "photo")
                                    .font(.system(size: 24))
                                    .foregroundColor(.white.opacity(0.4))
                            )
                    }
                    
                    Text(meme.memeDescription ?? "Speaks for itself.")
                        .font(.custom("Futura", size: 20))
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 10)
            }
        }
        
    }
}

#Preview {
    DetailsView(
        meme: MemeModel(
            title: "Bogos Binted",
            image: UIImage(named: "bogos_binted"),
            description: "Bogos binted funny description."
        )
    )
}
