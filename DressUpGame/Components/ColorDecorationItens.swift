//
//  ColorDecorationItens.swift
//  DressUpGame
//
//  Created by Daniel Leandro Campos Silva on 02/06/26.
//

import SwiftUI


struct ColorDecorationItens: View {
    
    var tap: (Color) -> Void
    
    @State var colors = [
        AssetColor(color: .grayColorNew),
        AssetColor(color: .beigeColorNew),
        AssetColor(color: .orangeColorNew),
        AssetColor(color: .redColorNew),
        AssetColor(color: .brownColorNew),
        AssetColor(color: .blueColorNew),
        AssetColor(color: .pinkColorNew),
        AssetColor(color: .purpleColorNew),
        AssetColor(color: .salmonColorNew)
    ]
    
    let sizeScreen: CGFloat = UIScreen.main.bounds.width + UIScreen.main.bounds.height / UIScreen.main.bounds.width
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 1)) {
                ForEach(colors, id: \.self) { colorOption in
                    Rectangle()
                        .foregroundColor(.white)
                        .overlay {
                            Circle()
                                .foregroundColor(colorOption.color)
                                .onTapGesture {
                                    tap(colorOption.color)
                                }
                        }
                        .aspectRatio(0.00173 * sizeScreen, contentMode: .fit)
                }
            }
            .padding(.horizontal, 10)
            .background(.white)
        }
    }
}
