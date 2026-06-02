//
//  ColorDecorationItens.swift
//  DressUpGame
//
//  Created by Daniel Leandro Campos Silva on 02/06/26.
//

import SwiftUI

struct ColorDecorationItens: View {
    
    @State var colors = [
        AssetColor(color: .grayColorNew),
        AssetColor(color: .beigeColorNew),
        AssetColor(color: .orangeColorNew),
        AssetColor(color: .redColorNew),
        AssetColor(color: .brownColorNew),
        AssetColor(color: .blueColorNew),
        AssetColor(color: .pinkColorNew),
        AssetColor(color: .purpleColorNew)
    ]
    
    let sizeScreen: CGFloat = UIScreen.main.bounds.width + UIScreen.main.bounds.height / UIScreen.main.bounds.width
    
    var body: some View {
//        ScrollView(.horizontal) {
        ViewThatFits {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 1)) {
                ForEach(colors, id: \.self) { colorOption in
                    Rectangle()
                        .foregroundColor(.white)
                        .overlay {
                            Circle()
                                .foregroundColor(Color(uiColor: colorOption.color))
                        }
                        .aspectRatio(0.00173 * sizeScreen, contentMode: .fit)
                }
            }
        }
        .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
            if axis == .vertical {
                return length * 0.1
            } else {
                return length
            }
        }
        .background(.white)
        
//        }
    }
    
}
