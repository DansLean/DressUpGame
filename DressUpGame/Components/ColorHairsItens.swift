//
//  ColorDecorationItens.swift
//  DressUpGame
//
//  Created by Daniel Leandro Campos Silva on 02/06/26.
//

import SwiftUI


struct ColorHairsItens: View {
    
    var tap: (AssetColor) -> Void
    
    @State var colors = [
        AssetColor(color: .grayColorNew, name: "Preto"),
        AssetColor(color: .beigeColorNew, name: "Loiro"),
        AssetColor(color: .orangeColorNew, name: "Ruivo médio"),
        AssetColor(color: .redColorNew, name: "Ruivo escuro"),
        AssetColor(color: .brownColorNew, name: "Castanho"),
        AssetColor(color: .blueColorNew, name: "Turquesa"),
        AssetColor(color: .pinkColorNew, name: "Rosa claro"),
        AssetColor(color: .purpleColorNew, name: "Roxo"),
        AssetColor(color: .salmonColorNew, name: "Rosa cereja")
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
                                    tap(colorOption)
                                }
                                .accessibilityLabel(colorOption.name)
                                .accessibilityHint("Toque duas vezes para selecionar a cor")
                        }
                        .aspectRatio(0.00173 * sizeScreen, contentMode: .fit)
                }
            }
            .padding(.horizontal, 10)
            .background(.white)
        }
    }
}
