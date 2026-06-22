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
    
    func setDoll(face: Asset) {
        self.face = face
    }
    
    func setHair(hair: Asset) {
        self.hair = hair
    }
    
    func setHairColor(hairColor: AssetColor) {
        self.hairColor = hairColor
        self.hair = self.hair
    }
    
    func setTop(top: Asset) {
        self.top = top
    }
    
    func setTopColor(topColor: AssetColor) {
        self.topColor = topColor
        self.top = self.top
    }
    
    func setBottom(bottom: Asset) {
        self.bottom = bottom
    }
    
    func setBottomColor(bottomColor: AssetColor) {
        self.bottomColor = bottomColor
        self.bottom = self.bottom
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
                .colorMultiply(doll.hairColor.color)
                .saturation(1)
                .offset(x: 0, y: -5)
            
            Image(uiImage: doll.shoes.image)   // Calçado
                .resizable()
                .scaledToFit()
            
            Image(uiImage: doll.bottom.image)   // Bottom
                .resizable()
                .scaledToFit()
                .colorMultiply(doll.bottomColor.color)
                .saturation(1)
            
            Image(uiImage: doll.top.image)   // Top
                .resizable()
                .scaledToFit()
                .colorMultiply(doll.topColor.color)
                .saturation(1)
            
            Image(uiImage: doll.accessories.image)   // Acessórios
                .resizable()
                .scaledToFit()
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("\(doll.face.description)\(doll.hair.description != "" ? " com " + doll.hair.description : "" )\(doll.top.description != "" ? ", vestindo " + doll.top.description : "")\(doll.bottom.description != "" ? ", e " + doll.bottom.description : "")\(doll.shoes.description != "" ? ", calçando " + doll.shoes.description : "")\(doll.accessories.description != "" ? ", usando " + doll.accessories.description : "").")
        .scaleEffect(0.7)
    }
}
