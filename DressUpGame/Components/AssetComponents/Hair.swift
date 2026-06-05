//
//  Cabelo1.swift
//  DressUpGame
//
//  Created by Daniel Leandro Campos Silva on 03/06/26.
//

import SwiftUI

struct Cabelo1: View {
    var body: some View {
        ZStack(alignment: .center) {
            Image("Cabelo1B")
                .foregroundStyle(.brownColorNew)
            Image("Cabelo1F")
                .foregroundStyle(.beigeColorNew)
        }
    }
}

#Preview {
    Cabelo1()
}
