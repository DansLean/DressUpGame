//
//  Doll.swift
//  DressUpGame
//
//  Created by User on 28/04/26.
//

import SwiftUI


@Observable
class DollClass: Identifiable {
    var face: Int
    var hair: Int
    var top: Int
    var bottom: Int
    var shoes: Int
    var accessories: Int
    
    init(face: Int, hair: Int, top: Int, bottom: Int, shoes: Int, accessories: Int) {
        self.face = face
        self.hair = hair
        self.top = top
        self.bottom = bottom
        self.shoes = shoes
        self.accessories = accessories
    }
    
    func setDoll(face: Int) {
        self.face = face
    }
    
    func setHair(hair: Int) {
        self.hair = hair
    }
    
    func setTop(top: Int) {
        self.top = top
    }
    
    func setBottom(bottom: Int) {
        self.bottom = bottom
    }
    
    func setShoes(shoes: Int) {
        self.shoes = shoes
    }
    
    func setAccessories(accessories: Int) {
        self.accessories = accessories
    }

}

struct DollView: View {
    let doll: DollClass
    var body: some View {
//        GeometryReader { geometry in
        ZStack(alignment: .center) {
                Image("Doll\(doll.face)")   // Boneca
                    .resizable()
                    .scaledToFit()
//                    .frame(width: geometry.size.width, height: geometry.size.height / 1.28)
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 30)
                    
                
                Image("Cabelo\(doll.hair)")   // Cabelo
                    .resizable()
                    .scaledToFit()
                    .offset(x: -1, y: -15)
//                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
//                    .position(x: geometry.size.width / 2 - 2, y: geometry.size.height / 2 + 16)
                
                Image("Shoes\(doll.shoes)")   // Calçado
                    .resizable()
                    .scaledToFit()
//                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 30)
                
                Image("Bottom\(doll.bottom)")   // Bottom
                    .resizable()
                    .scaledToFit()
//                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.82)
                
                Image("Top\(doll.top)")   // Top
                    .resizable()
                    .scaledToFit()
//                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.82)
                
                Image("Acessorio\(doll.accessories)")   // Acessórios
                    .resizable()
                    .scaledToFit()
//                    .frame(width: geometry.size.width / 2.5, height: geometry.size.height)
//                    .position(x: geometry.size.width / 2 - 8, y: geometry.size.height / 2 + 34)
            }
        .scaleEffect(0.7)
//            .ignoresSafeArea()
            
//        }
    }
    
}

//@Observable
//class DollClass: Identifiable {
//    var face: Image
//    var hair: Image
//    var top: Image
//    var bottom: Image
//    var shoes: Image
//    var accessories: Image
//
//    init(face: Image, hair: Image, top: Image, bottom: Image, shoes: Image, accessories: Image) {
//        self.face = face
//        self.hair = hair
//        self.top = top
//        self.bottom = bottom
//        self.shoes = shoes
//        self.accessories = accessories
//    }
//
//    func setDoll(face: Image) {
//        self.face = face
//    }
//
//    func setHair(hair: Image) {
//        self.hair = hair
//    }
//
//    func setTop(top: Image) {
//        self.top = top
//    }
//
//    func setBottom(bottom: Image) {
//        self.bottom = bottom
//    }
//
//    func setShoes(shoes: Image) {
//        self.shoes = shoes
//    }
//
//    func setAccessories(accessories: Image) {
//        self.accessories = accessories
//    }
//
//}
//
//struct DollView: View {
//    let doll: DollClass
//    var body: some View {
//        GeometryReader { geometry in
//            ZStack {
//                doll.face   // Boneca
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: geometry.size.width, height: geometry.size.height / 1.28)
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 30)
//
//                doll.hair   // Cabelo
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
//                    .position(x: geometry.size.width / 2 - 2, y: geometry.size.height / 2 + 16)
//
//                doll.shoes // Calçado
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 2 + 30)
//
//                doll.bottom  // Bottom
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.82)
//
//                doll.top  // Top
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: geometry.size.width / 3, height: geometry.size.height)
//                    .position(x: geometry.size.width / 2, y: geometry.size.height / 1.82)
//
//                doll.accessories  // Acessórios
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: geometry.size.width / 2.5, height: geometry.size.height)
//                    .position(x: geometry.size.width / 2 - 8, y: geometry.size.height / 2 + 34)
//            }
//        }
//    }
//
//}

#Preview {
    DollView(doll: DollClass(face: 1, hair: 0, top: 0, bottom: 0, shoes: 0, accessories: 0))
}
