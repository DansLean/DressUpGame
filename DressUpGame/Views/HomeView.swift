//
//  ContentView.swift
//  DressUpGame
//
//  Created by User on 22/04/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("HomeBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            VStack {
                HStack {
                    Button("", systemImage: "square.and.pencil"){}
                    Image("Doll")
                    VStack {
                        Button("", systemImage: "square.and.pencil"){}
                        Button("", systemImage: "square.and.pencil"){}
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
