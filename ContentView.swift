import SwiftUI

struct ContentView: View {
    @State private var selectedMeme: MemeModel?
    @State private var memes: [MemeModel] = [
        MemeModel(title: "Meme 1", image: UIImage(named: "bogos_binted"), description: "Funny description")
    ]
    @State private var isCreatingNew: Bool = false
    
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
                        
                        CardGridView(memes: memes,
                                     onSelect: {meme in selectedMeme = meme},
                                     onCreate: { isCreatingNew = true})
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.top, 5)
            }
            .navigationDestination(item: $selectedMeme) {
                meme in DetailsView(meme: meme)
            }
            .navigationDestination(isPresented: $isCreatingNew) {
                CreateCardView { newMeme in
                    memes.append(newMeme)}
            }
        }
    }
}



