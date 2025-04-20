//
//  SwiftUIView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 20/04/25.
//

import SwiftUI
import PhotosUI

struct ImageSelectionView: View {
    @Binding var selectedImage: UIImage?
    @Binding var selectedImageData: Data?
    @Binding var photoItem: PhotosPickerItem?
    
    var body: some View {
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
    }
}

#Preview {
    ImageSelectionView(
            selectedImage: .constant(nil),
            selectedImageData: .constant(nil),
            photoItem: .constant(nil)
        )
        .preferredColorScheme(.dark)
        .background(Color.black)
}
