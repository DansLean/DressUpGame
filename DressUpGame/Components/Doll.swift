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
                
                Image("Cabelo7")   // Cabelo
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
                    .position(x: geometry.size.width / 2 - 2, y: geometry.size.height / 2 + 16)
                
                Image("Shoes4")   // Calçado
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 30)
                
                Image("Bottom2")   // Bottom
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.82)
                
                Image("Top3")   // Top
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.82)
                
                Image("Acessorio9")   // Acessórios
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width / 2.5, height: geometry.size.height)
                    .position(x: geometry.size.width / 2 - 8, y: geometry.size.height / 2 + 34)
            }
        }
    }
}

#Preview {
    Doll()
}
