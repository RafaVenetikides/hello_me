//
//  DetailsView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 16/04/25.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            VStack (alignment: .leading){
                Text("Bogos Binted")
                    .padding(.top)
                    .padding(.horizontal)
                    .font(.custom("Futura", size: 30))
                    .foregroundColor(.white)
                
                HStack{
                    Spacer()
                    Rectangle()
                        .frame(width: 370 ,height: 1)
                        .foregroundStyle(.white)
                        .padding(.bottom, -16)
                    Spacer()
                }
                
                ScrollView{
                    VStack(spacing: 20){
                        Image("bogos_binted")
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 300)
                        
                        
                        Text("""
                            Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus tristique egestas tempus. Maecenas convallis euismod lorem non maximus. Vestibulum eu est leo. Mauris a diam ut orci tristique cursus. Quisque ac semper ipsum, eu tincidunt risus. Curabitur eu nisi sollicitudin, pellentesque nibh a, commodo purus. Fusce sit amet quam non. 
                            """)
                            .font(.custom("Futura", size: 20))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal, 20)
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.top, 10)
                }
            }
        }
    }
}

#Preview {
    DetailsView()
}
