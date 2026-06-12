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
    
    var tap: (Asset) -> Void
    
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
        Asset(image: UIImage(resource: .top1), description: "Camisa larga de tamanho médio, manga média e gola redonda"),
        Asset(image: UIImage(resource: .top2), description: "Camisa justa de tamanho médio, manga longa e gola redonda"),
        Asset(image: UIImage(resource: .top3), description: "Camisa regata justa, curta e de gola redonda"),
        Asset(image: UIImage(resource: .top4), description: "Camiseta de botões longa de mangas longas e detalhe na gola"),
        Asset(image: UIImage(resource: .top5), description: "Camisa larga e curta, com manga média e gola redonda"),
        Asset(image: UIImage(resource: .top6), description: "Moletom largo de mangas longas, detalhe de bolso frontal e gola com capuz"),
        Asset(image: UIImage(resource: .top7), description: "Vestido de tamanho médio, com caimento aberto na parte de baixo e justo na parte de cima, com detalhe de amarração no pescoço"),
        Asset(image: UIImage(resource: .top8), description: "Camisa regata com caimento solto e detalhe drapeado no busto"),
        Asset(image: UIImage(resource: .top9), description: "Camisa ombro-a-ombro com caimento solto"),
        Asset(image: UIImage(resource: .top10), description: "Camisa justa de tamanho médio, manga longa com listras horizontais, gola redonda e desenho de coelho no centro")
    ]
    
    @State var bottoms = [
        Asset(image: UIImage(resource: .bottom1), description: "Calça jeans larga com bolsos laterais"),
        Asset(image: UIImage(resource: .bottom2), description: "Saia curta com detalhe de amarração lateral"),
        Asset(image: UIImage(resource: .bottom3), description: "Bermuda cargo com bolsos grandes na lateral"),
        Asset(image: UIImage(resource: .bottom4), description: "Saia jeans curta com bolsos laterais"),
        Asset(image: UIImage(resource: .bottom5), description: "Calça jeans de cintura baixa e bolsos laterais"),
        Asset(image: UIImage(resource: .bottom6), description: "Calça de pijama com bolsos laterais e detalhes de costura"),
        Asset(image: UIImage(resource: .bottom7), description: "Short curto de pijama com bolsos laterais e detalhes de costura"),
        Asset(image: UIImage(resource: .bottom8), description: "Saia curta de babados bufante com detalhe no cós"),
        Asset(image: UIImage(resource: .bottom9), description: "Saia longa com detalhe de amarração na cintura")
    ]
    
    @State var shoes = [
        Asset(image: UIImage(resource: .shoes1), description: "Sapato unissex de cano baixo, bico arredondado, cadarços brancos e uma listra branca vertical na lateral."),
        Asset(image: UIImage(resource: .shoes2), description: "Sapato unissex de cano alto, bico arredondado e cadarços brancos"),
        Asset(image: UIImage(resource: .shoes3), description: "Sapatilha feminina de bico arredondado, solado grosso e fechada na parte de cima, deixando os dedos visíveis"),
        Asset(image: UIImage(resource: .shoes4), description: "Bota unissex de cano alto com detalhes que remetem correias "),
        Asset(image: UIImage(resource: .shoes5), description: "Sapatilha feminina de bico arredondado, salto tamanco, detalhe de fitas e meia")
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
                                    .accessibilityLabel(tab.description)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                            if self.selectedCustomization == .hair {
                                Image(uiImage: tab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 2
                                        } else {
                                            return length * 0.2
                                        }
                                    }
                                    .padding(.top, 0.55 * sizeScreen)
                                    .colorMultiply(assetHairColor)
                                    .saturation(1)
                                    .accessibilityLabel(tab.description)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
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
                                    .accessibilityLabel(tab.description)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
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
                                    .accessibilityLabel(tab.description)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
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
                                    .accessibilityLabel(tab.description)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                            if self.selectedCustomization == .accessories {
                                Image(uiImage: tab.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 320)
                                    .padding(.bottom, 3)
                                    .accessibilityLabel(tab.description)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                        }
                        .aspectRatio(0.0013 * sizeScreen, contentMode: .fit)
                        .onTapGesture {
                            tap(tab)
                        }
                }
            }
            .padding(.horizontal, 10)
            .background(Color.white)
            .foregroundStyle(.white)
        }
    }
}
