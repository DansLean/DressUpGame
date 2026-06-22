//
//  Doll.swift
//  DressUpGame
//
//  Created by User on 28/04/26.
//

import SwiftUI
import SwiftData

@Model
class DollClass {
    var face: Asset
    var hair: Asset
    var hairColor: AssetColor
    var top: Asset
    var topColor: AssetColor
    var bottom: Asset
    var bottomColor: AssetColor
    var shoes: Asset
    var accessories: Asset
    
    init(face: Asset, hair: Asset, hairColor: AssetColor, top: Asset, topColor: AssetColor, bottom: Asset, bottomColor: AssetColor, shoes: Asset, accessories: Asset) {
        self.face = face
        self.hair = hair
        self.hairColor = hairColor
        self.top = top
        self.topColor = topColor
        self.bottom = bottom
        self.bottomColor = bottomColor
        self.shoes = shoes
        self.accessories = accessories
    }
//    
//    func setDoll(face: Asset) {
//        self.face = face
//    }
//    
//    func setHair(hair: Asset) {
//        self.hair = hair
//    }
//    
//    func setHairColor(hairColor: AssetColor) {
//        self.hairColor = hairColor
//        self.hair = self.hair
//    }
//    
//    func setTop(top: Asset) {
//        self.top = top
//    }
//    
//    func setTopColor(topColor: AssetColor) {
//        self.topColor = topColor
//        self.top = self.top
//    }
//    
//    func setBottom(bottom: Asset) {
//        self.bottom = bottom
//    }
//    
//    func setBottomColor(bottomColor: AssetColor) {
//        self.bottomColor = bottomColor
//        self.bottom = self.bottom
//    }
//    
//    func setShoes(shoes: Asset) {
//        self.shoes = shoes
//    }
//    
//    func setAccessories(accessories: Asset) {
//        self.accessories = accessories
//    }
}

struct DollView: View {
    let doll: DollClass
    
    var body: some View {
        ZStack(alignment: .center) {
            Image(doll.face.image) // Boneca
                .resizable()
                .scaledToFit()
            
            Image(doll.hair.image)   // Cabelo
                .resizable()
                .scaledToFit()
                .colorMultiply(Color(doll.hairColor.color))
                .saturation(1)
                .offset(x: 0, y: -5)
            
            Image(doll.shoes.image)   // Calçado
                .resizable()
                .scaledToFit()
            
            Image(doll.bottom.image)   // Bottom
                .resizable()
                .scaledToFit()
                .colorMultiply(Color(doll.bottomColor.color))
                .saturation(1)
            
            Image(doll.top.image)   // Top
                .resizable()
                .scaledToFit()
                .colorMultiply(Color(doll.topColor.color))
                .saturation(1)
            
            Image(doll.accessories.image)   // Acessórios
                .resizable()
                .scaledToFit()
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(doll.face.desc)\(doll.hair.desc != "" ? " com " + doll.hair.desc : "" )\(doll.top.desc != "" ? ", vestindo " + doll.top.desc : "")\(doll.bottom.desc != "" ? ", e " + doll.bottom.desc : "")\(doll.shoes.desc != "" ? ", calçando " + doll.shoes.desc : "")\(doll.accessories.desc != "" ? ", usando " + doll.accessories.desc : "").")
        .scaleEffect(0.7)
    }
}
