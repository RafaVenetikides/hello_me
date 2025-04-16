import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black.opacity(0.8)
                .ignoresSafeArea()
            ScrollView{
                Spacer(minLength: 16)
                VStack {
                    ProfileHeaderView()
                    
                Divider()
                        .frame(width: 340)
                        .padding(.bottom, 16)
                
                CardGridView(numberOfCards: 10)
                }
            }
            .scrollIndicators(ScrollIndicatorVisibility.hidden)
            .padding(.top, 5)
        }
    }
}



