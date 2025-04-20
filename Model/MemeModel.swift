//
//  MemeModel.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 16/04/25.
//
import SwiftUI

struct MemeModel: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let image: UIImage?
    let description: String?
}
