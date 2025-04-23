//
//  CreateCardView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 19/04/25.
//

import SwiftUI
import PhotosUI

struct CreateCardView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var selectedImageData: Data?
    @State private var selectedImage: UIImage?
    @State private var photoItem: PhotosPickerItem?
    
    var onSave: (MemeModel) -> Void
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("New Meme")
                .font(.custom("Futura", size: 28))
                .foregroundColor(.white)
            
            TextField("An interesting title", text: $title)
                .textFieldStyle(.roundedBorder)
            
            ImageSelectionView(
                selectedImage: $selectedImage,
                selectedImageData: $selectedImageData,
                photoItem: $photoItem
            )
            
            ZStack(alignment: .topLeading){
                TextEditor(text: $description)
                    .frame(height: 100)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(8)
                    .foregroundColor(.black)
                    .textFieldStyle(.roundedBorder)
                if (description.isEmpty) {
                    Text("Description")
                        .foregroundColor(.black.opacity(0.2))
                        .padding(.top, 8)
                        .padding(.horizontal, 5)
                }
            }
            
            Button("Salvar", action: saveMeme)
                .disabled(title.isEmpty || selectedImage == nil)
                .opacity((title.isEmpty || selectedImage == nil) ? 0.5 : 1.0)
            
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue.opacity((title.isEmpty || selectedImage == nil) ? 0.5 : 1.0))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            
            Spacer()
        }
        .padding()
    }
    
    private func saveMeme() {
        let newCard = MemeModel(title: title, image: selectedImage, description: description)
        onSave(newCard)
        dismiss()
    }
}

#Preview {
    CreateCardView{meme in
        print("Salvando meme: \(meme.title)")}
    .preferredColorScheme(.light)
}
