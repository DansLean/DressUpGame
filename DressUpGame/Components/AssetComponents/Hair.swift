//
//  Cabelo1.swift
//  DressUpGame
//
//  Created by Daniel Leandro Campos Silva on 03/06/26.
//

import SwiftUI


struct Hair: View {
    
    @Binding var hair: Asset
    @Binding var hairColor: AssetColor
    
    var body: some View {
        VStack(alignment: .center) {
            Image(uiImage: hair.image)
                .colorMultiply(hairColor.color)
                .saturation(3)
        }
    }
}

#Preview {
    @Previewable @State var hair = Asset(
        image: UIImage(resource: .cabeloTeste),
    )
    
    @Previewable @State var hairColor = AssetColor(
        color: .grayColorNew,
    )
    
    Hair(
        hair: $hair,
        hairColor: $hairColor
    )
}
