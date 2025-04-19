//
//  SwiftUIView.swift
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
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(alignment: .leading, spacing: 16) {
                Text("New Meme")
                    .font(.custom("Futura", size: 28))
                    .foregroundColor(.white)

                TextField("An interesting title", text: $title)
                    .textFieldStyle(.roundedBorder)
                
                PhotosPicker(selection: $photoItem,
                             matching: .images,
                             photoLibrary: .shared()){
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.1))
                            .frame(height: 150)
                            .overlay(
                                Group {
                                    if let image = selectedImage {
                                        Image(uiImage: image)
                                            .resizable()
                                            .scaledToFit()
                                            .frame(height: 150)
                                            .clipped()
                                    } else {
                                        VStack {
                                            Image(systemName: "photo.on.rectangle")
                                                .font(.system(size:30))
                                                .foregroundColor(.gray)
                                            Text("Select Image")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                }
                            )
                    }
                }
                 .onChange(of: photoItem) {newItem in
                     Task {
                         if let data = try? await newItem?.loadTransferable(type: Data.self) {
                             selectedImageData = data
                             if let uiImage = UIImage(data: data) {
                                 selectedImage = uiImage
                             }
                         }
                     }
                 }

                ZStack(alignment: .topLeading){
                        TextEditor(text: $description)
                            .frame(height: 100)
                            .background(Color.white.opacity(0.1))
                            .cornerRadius(8)
                            .foregroundColor(.white)
                    if (description.isEmpty) {
                        Text("Description")
                            .foregroundColor(.white.opacity(0.2))
                            .padding(.top, 8)
                            .padding(.horizontal, 5)
                    }
                }

                Button("Salvar") {
                    let newCard = MemeModel(title: title, image: selectedImage)
                    onSave(newCard)
                    dismiss()
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.gray.opacity(0.3))
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: 12))

                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CreateCardView{meme in
        print("Salvando meme: \(meme.title)")}
    .preferredColorScheme(.dark)
}
