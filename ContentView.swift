//
//  ContentView.swift
//  Hello, Me!
//
//  Created by Rafael Venetikides on 23/04/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            CatalogView()
                .tabItem {
                    Label("Catalog", systemImage: "book")
                }
            
            AboutMeView()
                .tabItem {
                    Label("About Me", systemImage: "person")
                }
        }
        .background(Color(red: 0.96, green: 0.96, blue: 0.95))
    }
}

#Preview {
    ContentView()
}
