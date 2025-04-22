import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedMeme: MemeModel?
    @Query private var memes: [MemeModel]
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
                        
                        CardGridView(
                            memes: memes,
                            onSelect: {meme in selectedMeme = meme},
                            onCreate: { isCreatingNew = true},
                            onDelete: { memeToDelete in
                                modelContext.delete(memeToDelete)
                            }
                        )
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
                    modelContext.insert(newMeme)}
            }
        }
    }
}



