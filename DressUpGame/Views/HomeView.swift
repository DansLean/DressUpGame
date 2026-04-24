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
                    Button {
                      // Button actions here.
                    } label: {
                      Image(systemName: "trash.fill")
                    }
                    .buttonBorderShape(.circle)
                    .buttonStyle(.glass)
                    Image("Doll")
                    VStack {
                        Button {
                          // Button actions here.
                        } label: {
                          Image(systemName: "rectangle.portrait.badge.plus")
                        }
                        .buttonBorderShape(.circle)
                        .buttonStyle(.glass)
                        Button {
                          // Button actions here.
                        } label: {
                          Image(systemName: "hanger")
                        }
                        .buttonBorderShape(.circle)
                        .buttonStyle(.glass)
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
