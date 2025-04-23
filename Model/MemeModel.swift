//
//  MemeModel.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 16/04/25.
//
import SwiftData
import UIKit

@Model
class MemeModel {
    var title: String
    var imageData: Data?
    var memeDescription: String?
    var creationTime: Date?
    
    init(title: String, image: UIImage?, description: String? = nil) {
        self.title = title
        self.imageData = image?.jpegData(compressionQuality: 0.8)
        self.memeDescription = description
        self.creationTime = Date()
    }
    
    var image: UIImage? {
        if let data = imageData {
            return UIImage(data: data)
        }
        return nil
    }
}
