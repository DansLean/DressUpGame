//
//  Doll.swift
//  DressUpGame
//
//  Created by User on 28/04/26.
//

import SwiftUI


@Observable
class DollClass: Identifiable {
    var face: Asset
    var hair: Asset
    var top: Asset
    var bottom: Asset
    var shoes: Asset
    var accessories: Asset
    
    init(face: Asset, hair: Asset, top: Asset, bottom: Asset, shoes: Asset, accessories: Asset) {
        self.face = face
        self.hair = hair
        self.top = top
        self.bottom = bottom
        self.shoes = shoes
        self.accessories = accessories
    }
    
    func setDoll(face: Asset) {
        self.face = face
    }
    
    func setHair(hair: Asset) {
        self.hair = hair
    }
    
    func setTop(top: Asset) {
        self.top = top
    }
    
    func setBottom(bottom: Asset) {
        self.bottom = bottom
    }
    
    func setShoes(shoes: Asset) {
        self.shoes = shoes
    }
    
    func setAccessories(accessories: Asset) {
        self.accessories = accessories
    }
}

struct DollView: View {
    let doll: DollClass
    var body: some View {
        ZStack(alignment: .center) {
            Image(uiImage: doll.face.image) // Boneca
                    .resizable()
                    .scaledToFit()
                    
                
            Image(uiImage: doll.hair.image)   // Cabelo
                    .resizable()
                    .scaledToFit()
                    .offset(x: -1, y: -15)
                
            Image(uiImage: doll.shoes.image)   // Calçado
                    .resizable()
                    .scaledToFit()
                
            Image(uiImage: doll.bottom.image)   // Bottom
                    .resizable()
                    .scaledToFit()
                
            Image(uiImage: doll.top.image)   // Top
                    .resizable()
                    .scaledToFit()
                
            Image(uiImage: doll.accessories.image)   // Acessórios
                    .resizable()
                    .scaledToFit()
            }
        .scaleEffect(0.7)
    }
}

#Preview {
    DollView(doll: DollClass(face: Asset(image: UIImage(resource: .doll1)), hair: Asset(image: UIImage()), top: Asset(image: UIImage()), bottom: Asset(image: UIImage()), shoes: Asset(image: UIImage()), accessories: Asset(image: UIImage())))
}
