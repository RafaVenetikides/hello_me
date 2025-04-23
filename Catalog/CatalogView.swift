import SwiftUI
import SwiftData

struct CatalogView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var selectedMeme: MemeModel?
    @Query( sort: \MemeModel.creationTime, order: .forward)
    private var memes: [MemeModel]
    @State private var isCreatingNew: Bool = false
    @State private var editedMeme: MemeModel?
    
    var body: some View {
        NavigationStack{
            ZStack{
                Spacer(minLength: 16)
                
                VStack {
                    Text("Rafinha's Meme Collection")
                        .font(.custom("Zapfino", size: 20))
                        .padding(.bottom, 1)
                    
//                    Divider()
//                        .frame(width: 340)
//                        .padding(.bottom, 1)
                    
                    ScrollView{
                        CardGridView(
                            memes: memes,
                            onSelect: {meme in selectedMeme = meme},
                            onCreate: { isCreatingNew = true},
                            onEdit: {meme in editedMeme = meme},
                            onDelete: { memeToDelete in
                                modelContext.delete(memeToDelete)
                            }
                        )
                        .padding(.top, 10)
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.top, 5)
                .background(Color(red: 0.96, green: 0.96, blue: 0.95))
            }
            .navigationDestination(item: $selectedMeme) {
                meme in DetailsView(meme: meme)
            }
            .navigationDestination(isPresented: $isCreatingNew) {
                CreateCardView { newMeme in
                    modelContext.insert(newMeme)}
            }
            .navigationDestination(item: $editedMeme) {
                meme in CreateCardView(editing: meme) {_ in }}
        }
    }
}



