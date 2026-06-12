//
//  DecorationItens.swift
//  DressUpGame
//
//  Created by USER on 28/04/26.
//
import SwiftUI


struct AvatarDecorationItens: View {
    @Binding var selectedCustomization: AvatarOptions
    @Binding var assetHairColor: Color
    @Binding var assetTopColor: Color
    @Binding var assetBottomColor: Color
    
    var tap: (UIImage) -> Void
    
    @State var faces = [
        Asset(image: UIImage(resource: .doll1), description: "Boneca com traços femininos de tom claro"),
        Asset(image: UIImage(resource: .doll2), description: "Boneca com traços masculinos de tom claro"),
        Asset(image: UIImage(resource: .doll7), description: "Boneca com traços femininos de tom médio claro"),
        Asset(image: UIImage(resource: .doll8), description: "Boneca com traços masculinos de tom médio claro"),
        Asset(image: UIImage(resource: .doll3), description: "Boneca com traços femininos de tom médio escuro"),
        Asset(image: UIImage(resource: .doll4), description: "Boneca com traços masculinos de tom médio escuro"),
        Asset(image: UIImage(resource: .doll5), description: "Boneca com traços femininos de tom escuro"),
        Asset(image: UIImage(resource: .doll6), description: "Boneca com traços masculinos de tom escuro")
    ]
    
    @State var hairs = [
        Asset(image: UIImage(resource: .cabelo1), description: "Cabelo masculino curto e ondulado"),
        Asset(image: UIImage(resource: .cabelo2), description: "Cabelo masculino curto, liso com franjas emoldurando o rosto"),
        Asset(image: UIImage(resource: .cabelo3), description: "Cabelo masculino curto, liso sem franja"),
        Asset(image: UIImage(resource: .cabelo4), description: "Cabelo masculino curto cacheado com suíças descendo até a orelha"),
        Asset(image: UIImage(resource: .cabelo5), description: "Cabelo masculino curto, crespo"),
        Asset(image: UIImage(resource: .cabelo6), description: "Cabelo feminino médio, liso com franja reta"),
        Asset(image: UIImage(resource: .cabelo7), description: "Cabelo feminino longo, liso com franja reta"),
        Asset(image: UIImage(resource: .cabelo8), description: "Cabelo feminino crespo com franja emoldurando o rosto e dois coques nas laterais."),
        Asset(image: UIImage(resource: .cabelo9), description: "Cabelo feminino curto, liso com franja reta"),
        Asset(image: UIImage(resource: .cabelo10), description: "Cabelo feminino curto, liso com franja lateral"),
        Asset(image: UIImage(resource: .cabelo11), description: "Cabelo feminino longo, ondulado com franja curta repicada"),
        Asset(image: UIImage(resource: .cabelo12), description: "Cabelo feminino longo cacheado"),
        Asset(image: UIImage(resource: .cabelo13), description: "Cabelo feminino curto cacheado")
    ]
    
    @State var tops = [
        Asset(image: UIImage(resource: .top1), description: ""),
        Asset(image: UIImage(resource: .top2), description: ""),
        Asset(image: UIImage(resource: .top3), description: ""),
        Asset(image: UIImage(resource: .top4), description: ""),
        Asset(image: UIImage(resource: .top5), description: ""),
        Asset(image: UIImage(resource: .top6), description: ""),
        Asset(image: UIImage(resource: .top7), description: "")
    ]
    
    @State var bottoms = [
        Asset(image: UIImage(resource: .bottom1), description: ""),
        Asset(image: UIImage(resource: .bottom2), description: ""),
        Asset(image: UIImage(resource: .bottom3), description: "")
    ]
    
    @State var shoes = [
        Asset(image: UIImage(resource: .shoes1), description: ""),
        Asset(image: UIImage(resource: .shoes2), description: ""),
        Asset(image: UIImage(resource: .shoes3), description: ""),
        Asset(image: UIImage(resource: .shoes4), description: "")
    ]
    
    @State var accessories = [
        Asset(image: UIImage(resource: .acessorio1), description: ""),
        Asset(image: UIImage(resource: .acessorio2), description: ""),
        Asset(image: UIImage(resource: .acessorio3), description: ""),
        Asset(image: UIImage(resource: .acessorio4), description: ""),
        Asset(image: UIImage(resource: .acessorio5), description: ""),
        Asset(image: UIImage(resource: .acessorio6), description: ""),
        Asset(image: UIImage(resource: .acessorio7), description: ""),
        Asset(image: UIImage(resource: .acessorio8), description: ""),
        Asset(image: UIImage(resource: .acessorio9), description: ""),
        Asset(image: UIImage(resource: .acessorio10), description: ""),
        Asset(image: UIImage(resource: .acessorio11), description: ""),
        Asset(image: UIImage(resource: .acessorio12), description: "")
    ]
    
    let sizeScreen: CGFloat = UIScreen.main.bounds.width + UIScreen.main.bounds.height / UIScreen.main.bounds.width
    
    var selectedTab: [Asset] {
        switch (selectedCustomization) {
        case .face:
            return faces
        case .hair:
            return hairs
        case .top:
            return tops
        case .bottom:
            return bottoms
        case .shoes:
            return shoes
        case .accessories:
            return accessories
        }
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 1)) {
                ForEach(selectedTab, id: \.self) { tab in
                    Rectangle()
                        .overlay {
                            if self.selectedCustomization == .face {
                                Image(uiImage: tab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 2
                                        } else {
                                            return length * 0.25
                                        }
                                    }
                                    .padding(.top, 0.45 * sizeScreen)
                            }
                            if self.selectedCustomization == .hair {
                                Image(uiImage: tab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 4
                                        } else {
                                            return length * 0.2
                                        }
                                    }
                                    .padding(.top, 0.55 * sizeScreen)
                                    .colorMultiply(assetHairColor)
                                    .saturation(1)
                            }
                            if self.selectedCustomization == .top {
                                Image(uiImage: tab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 2
                                        } else {
                                            return length * 0.5
                                        }
                                    }
                                    .padding(.top, 0.08 * sizeScreen)
                                    .colorMultiply(assetTopColor)
                                    .saturation(1)
                            }
                            if self.selectedCustomization == .bottom {
                                Image(uiImage: tab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 1.6
                                        } else {
                                            return length * 0.2
                                        }
                                    }
                                    .padding(.top, -0.2 * sizeScreen)
                                    .colorMultiply(assetBottomColor)
                                    .saturation(1)
                            }
                            if self.selectedCustomization == .shoes {
                                Image(uiImage: tab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 1.8
                                        } else {
                                            return length * 0.3
                                        }
                                    }
                                    .padding(.top, -0.75 * sizeScreen)
                            }
                            if self.selectedCustomization == .accessories {
                                Image(uiImage: tab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 320)
                                    .padding(.bottom, 3)
                            }
                        }
                        .aspectRatio(0.0013 * sizeScreen, contentMode: .fit)
                        .onTapGesture {
                            tap(tab.image)
                        }
                }
            }
            .padding(.horizontal, 10)
            .background(Color.white)
            .foregroundStyle(.white)
        }
    }
}
