//
//  ColorDecorationItens.swift
//  DressUpGame
//
//  Created by Daniel Leandro Campos Silva on 02/06/26.
//

import SwiftUI


struct ColorClothesItens: View {
    
    var tap: (AssetColor) -> Void
    
    @State var colors = [
        AssetColor(color: .grayColorNew, name: "Preto"),
        AssetColor(color: .brownColorNew, name: "Marrom"),
        AssetColor(color: .lightGrayColorClothes, name: "Cinza"),
        AssetColor(color: .yellowColorClothes, name: "Amarelo"),
        AssetColor(color: .greenColorClothes, name: "Verde"),
        AssetColor(color: .blueColorNew, name: "Turquesa"),
        AssetColor(color: .pinkColorNew, name: "Rosa"),
        AssetColor(color: .lightPurpleColorClothes, name: "Roxo"),
        AssetColor(color: .salmonColorNew, name: "Rosa cereja"),
        AssetColor(color: .lightSalmonColorClothes, name: "Rosa claro"),
        AssetColor(color: .evenLighterPuplerColorClothes, name: "Roxo claro"),
        AssetColor(color: .blueGrayColorClothes, name: "Azul escuro"),
        AssetColor(color: .lightDarkGreenColorClothes, name: "Verde azulado"),
        AssetColor(color: .lightBlueColorClothes, name: "Azul claro")
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
