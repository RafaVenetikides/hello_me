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
    @Environment(\.modelContext) var modelContext
    
    @State private var title: String
    @State private var description: String
    @State private var selectedImageData: Data?
    @State private var selectedImage: UIImage?
    @State private var photoItem: PhotosPickerItem?
    
    let editing: MemeModel?
    var onSave: (MemeModel) -> Void
    
    init(editing: MemeModel? = nil, onSave: @escaping (MemeModel) -> Void) {
        self.editing = editing
        self.onSave = onSave
        _title = State(initialValue: editing?.title ?? "")
        _description = State(initialValue: editing?.memeDescription ?? "")
        _selectedImageData = State(initialValue: editing?.imageData)
        _selectedImage = State(initialValue: editing?.image)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("New Meme")
                .font(.unnaBold(32))
                .foregroundColor(.black)
            
            TextField("An interesting title", text: $title)
                .font(.unnaBold(20))
                .textFieldStyle(.roundedBorder)
            
            ImageSelectionView(
                selectedImage: $selectedImage,
                selectedImageData: $selectedImageData,
                photoItem: $photoItem
            )
            
            ZStack(alignment: .topLeading){
                TextEditor(text: $description)
                    .frame(height: 100)
                    .font(.unnaRegular(20))
                    .background(Color.white.opacity(0.1))
                    .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray.opacity(0.4), lineWidth: 1)
                            )
                    .cornerRadius(8)
                    .foregroundColor(.black)
                if (description.isEmpty) {
                    Text("Description")
                        .font(.unnaRegular(20))
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
        .background(Color(red: 0.96, green: 0.96, blue: 0.95))
    }
    
    private func saveMeme() {
        if let editing = editing {
            editing.title = title
            editing.memeDescription = description
            editing.imageData = selectedImage?.jpegData(compressionQuality: 0.8)
            dismiss()
        } else{
            let newCard = MemeModel(title: title, image: selectedImage, description: description)
            onSave(newCard)
            dismiss()
        }
    }
}

#Preview {
    CreateCardView { meme in
        print("Salvando meme: \(meme.title)")
    }
    .preferredColorScheme(.light)
    .modelContainer(for: MemeModel.self)
}
