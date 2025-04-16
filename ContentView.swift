import SwiftUI

struct ContentView: View {
    @State private var selectedMeme: MemeModel?
    
    let memes: [MemeModel] = (1...10).map{
        MemeModel(title: "Meme \($0)", imageName: "bogos_binted")
    }
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.black
                    .ignoresSafeArea()
                
                ScrollView{
                    Spacer(minLength: 16)
                    VStack {
                        ProfileHeaderView()
                        
                        Divider()
                            .frame(width: 340)
                            .padding(.bottom, 16)
                        
                        CardGridView(memes: memes) { meme in
                            selectedMeme = meme}
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.top, 5)
            }
            .navigationDestination(item: $selectedMeme) {
                meme in DetailsView()
            }
        }
    }
}



