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
            HStack {
                Text("Hello, World!")
            }
        }
    }
}

#Preview {
    HomeView()
}
