//
//  Doll.swift
//  DressUpGame
//
//  Created by User on 28/04/26.
//

import SwiftUI

struct Doll: View {
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Image("Doll")   // Boneca
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height / 1.25)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 30)
                Image("Cabelo1")   // Cabelo
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 3, height: geometry.size.height / 1.25)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 - 220)
                Image("")   // Acessórios
                Image("Shoes1")   // Calçado
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 2.6, height: geometry.size.height / 1.25)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 275)
                Image("Bottom1")   // Bottom
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 2.8, height: geometry.size.height / 1.25)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 100)
                Image("Top1")   // Top
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 2.8, height: geometry.size.height / 1.25)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 - 55)
            }
        }
    }
}

#Preview {
    Doll()
}
