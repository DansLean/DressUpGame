//
//  DecorationItens.swift
//  DressUpGame
//
//  Created by USER on 28/04/26.
//
import SwiftUI


struct AvatarDecorationItens: View {
    @Binding var selectedCustomization: AvatarOptions
    @Binding var assetHairColor: AssetColor
    @Binding var assetTopColor: AssetColor
    @Binding var assetBottomColor: AssetColor
    
    var tap: (Asset) -> Void
    
    @State var lastTappedIndex: Int?
    
    @State var faces = [
        Asset(image: "Doll1", gridImage: nil, desc: "Boneca com traços femininos de tom claro"),
        Asset(image: "Doll2", gridImage: nil, desc: "Boneca com traços masculinos de tom claro"),
        Asset(image: "Doll7", gridImage: nil, desc: "Boneca com traços femininos de tom médio claro"),
        Asset(image: "Doll8", gridImage: nil, desc: "Boneca com traços masculinos de tom médio claro"),
        Asset(image: "Doll5", gridImage: nil, desc: "Boneca com traços femininos de tom médio escuro"),
        Asset(image: "Doll6", gridImage: nil, desc: "Boneca com traços masculinos de tom médio escuro"),
        Asset(image: "Doll3", gridImage: nil, desc: "Boneca com traços femininos de tom escuro"),
        Asset(image: "Doll4", gridImage: nil, desc: "Boneca com traços masculinos de tom escuro")
        
    ]
    
    var hairs: [Asset] {
        [
            Asset(image: "Cabelo1", gridImage: nil, desc: "Cabelo \(assetHairColor.name) masculino curto e ondulado"),
            Asset(image: "Cabelo2", gridImage: nil, desc: "Cabelo \(assetHairColor.name) masculino curto, liso com franjas emoldurando o rosto"),
            Asset(image: "Cabelo3", gridImage: nil, desc: "Cabelo \(assetHairColor.name) masculino curto, liso sem franja"),
            Asset(image: "Cabelo4", gridImage: nil, desc: "Cabelo \(assetHairColor.name) masculino curto cacheado com suíças descendo até a orelha"),
            Asset(image: "Cabelo5", gridImage: nil, desc: "Cabelo \(assetHairColor.name) masculino curto, crespo"),
            Asset(image: "Cabelo6", gridImage: nil, desc: "Cabelo \(assetHairColor.name) feminino médio, liso com franja reta"),
            Asset(image: "Cabelo7", gridImage: nil, desc: "Cabelo \(assetHairColor.name) feminino longo, liso com franja reta"),
            Asset(image: "Cabelo8", gridImage: nil, desc: "Cabelo \(assetHairColor.name) feminino crespo com franja emoldurando o rosto e dois coques nas laterais."),
            Asset(image: "Cabelo9", gridImage: nil, desc: "Cabelo \(assetHairColor.name) feminino curto, liso com franja reta"),
            Asset(image: "Cabelo10", gridImage: nil, desc: "Cabelo \(assetHairColor.name) feminino curto, liso com franja lateral"),
            Asset(image: "Cabelo11", gridImage: nil, desc: "Cabelo \(assetHairColor.name) feminino longo, ondulado com franja curta repicada"),
            Asset(image: "Cabelo12", gridImage: nil, desc: "Cabelo \(assetHairColor.name) feminino longo cacheado"),
            Asset(image: "Cabelo13", gridImage: nil, desc: "Cabelo \(assetHairColor.name) feminino curto cacheado")
        ]
    }
    
    var tops: [Asset] {
        [
            Asset(image: "Top1", gridImage: nil, desc: "Camisa \(assetTopColor.name) larga de tamanho médio, manga média e gola redonda"),
            Asset(image: "Top2", gridImage: nil, desc: "Camisa \(assetTopColor.name)justa de tamanho médio, manga longa e gola redonda"),
            Asset(image: "Top3", gridImage: nil, desc: "Camisa \(assetTopColor.name)regata justa, curta e de gola redonda"),
            Asset(image: "Top4", gridImage: nil, desc: "Camiseta \(assetTopColor.name) de botões longa de mangas longas e detalhe na gola"),
            Asset(image: "Top5", gridImage: nil, desc: "Camisa \(assetTopColor.name) larga e curta, com manga média e gola redonda"),
            Asset(image: "Top6", gridImage: nil, desc: "Moletom \(assetTopColor.name) largo de mangas longas, detalhe de bolso frontal e gola com capuz"),
            Asset(image: "Top7", gridImage: nil, desc: "Vestido \(assetTopColor.name) de tamanho médio, com caimento aberto na parte de baixo e justo na parte de cima, com detalhe de amarração no pescoço"),
            Asset(image: "Top8", gridImage: nil, desc: "Camisa \(assetTopColor.name) regata com caimento solto e detalhe drapeado no busto"),
            Asset(image: "Top9", gridImage: nil, desc: "Camisa \(assetTopColor.name) ombro-a-ombro com caimento solto"),
            Asset(image: "Top10", gridImage: nil, desc: "Camisa \(assetTopColor.name) justa de tamanho médio, manga longa com listras horizontais, gola redonda e desenho de coelho no centro")
        ]
    }
    
    var bottoms: [Asset] {
        [
            Asset(image: "Bottom1", gridImage: nil, desc: "Calça jeans \(assetBottomColor.name) larga com bolsos laterais"),
            Asset(image: "Bottom2", gridImage: nil, desc: "Saia \(assetBottomColor.name) curta com detalhe de amarração lateral"),
            Asset(image: "Bottom3", gridImage: nil, desc: "Bermuda cargo \(assetBottomColor.name) com bolsos grandes na lateral"),
            Asset(image: "Bottom4", gridImage: nil, desc: "Saia jeans \(assetBottomColor.name) curta com bolsos laterais"),
            Asset(image: "Bottom5", gridImage: nil, desc: "Calça jeans \(assetBottomColor.name) de cintura baixa e bolsos laterais"),
            Asset(image: "Bottom6", gridImage: nil, desc: "Calça de pijama \(assetBottomColor.name) com bolsos laterais e detalhes de costura"),
            Asset(image: "Bottom7", gridImage: nil, desc: "Short curto de pijama \(assetBottomColor.name) com bolsos laterais e detalhes de costura"),
            Asset(image: "Bottom8", gridImage: nil, desc: "Saia curta \(assetBottomColor.name) de babados bufante com detalhe no cós"),
            Asset(image: "Bottom9", gridImage: nil, desc: "Saia longa \(assetBottomColor.name) com detalhe de amarração na cintura")
        ]
    }
    
    @State var shoes = [
        Asset(image: "Shoes1", gridImage: nil, desc: "Sapato unissex de cano baixo, bico arredondado, cadarços brancos e uma listra branca vertical na lateral."),
        Asset(image: "Shoes2", gridImage: nil, desc: "Sapato unissex de cano alto, bico arredondado e cadarços brancos"),
        Asset(image: "Shoes3", gridImage: nil, desc: "Sapatilha feminina de bico arredondado, solado grosso e fechada na parte de cima, deixando os dedos visíveis"),
        Asset(image: "Shoes4", gridImage: nil, desc: "Bota unissex de cano alto com detalhes que remetem correias "),
        Asset(image: "Shoes5", gridImage: nil, desc: "Sapatilha feminina de bico arredondado, salto tamanco, detalhe de fitas e meia")
    ]
    
    @State var accessories = [
        Asset(image: "Acessorio1", gridImage: "GridAcessorio1", desc: "Bolsa carteiro de lado com alça grossa"),
        Asset(image: "Acessorio2", gridImage: "GridAcessorio2", desc: "Bolsa carteiro de lado com pingentes pendurados"),
        Asset(image: "Acessorio3", gridImage: "GridAcessorio3", desc: "Cinto grosso com uma estrela no centro e detalhe de teclas de piano"),
        Asset(image: "Acessorio4", gridImage: "GridAcessorio4", desc: "Cinto grosso de ilhós prata"),
        Asset(image: "Acessorio5", gridImage: "GridAcessorio5", desc: "Brincos pequenos arredondados"),
        Asset(image: "Acessorio6", gridImage: "GridAcessorio6", desc: "Brincos pequenos de pingente"),
        Asset(image: "Acessorio7", gridImage: "GridAcessorio7", desc: "Bracelete duplo"),
        Asset(image: "Acessorio8", gridImage: "GridAcessorio8", desc: "Bracelete com detalhes de pedras encrostadas"),
        Asset(image: "Acessorio9", gridImage: "GridAcessorio9", desc: "Relógio de ponteiro fino"),
        Asset(image: "Acessorio10", gridImage: "GridAcessorio10", desc: "Óculos retangulares simples"),
        Asset(image: "Acessorio11", gridImage: "GridAcessorio11", desc: "Óculos escuros com detalhe de estrela na lateral"),
        Asset(image: "Acessorio12", gridImage: "GridAcessorio12", desc: "Óculos estilo gatinho"),
        Asset(image: "Acessorio13", gridImage: "gridAcessorio13", desc: "Meias grossas que cobrem a região do tornozelo até o joelho com detalhe de laço nas laterais")
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
                if (self.selectedCustomization == .hair || self.selectedCustomization == .top || self.selectedCustomization == .bottom || self.selectedCustomization == .shoes || self.selectedCustomization == .accessories) {
                    VStack (alignment: .center, spacing: 10) {
                        Image(uiImage: UIImage(resource: .multiplyPersonalizado))
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35, height: 35)
                            .foregroundColor(.gray4)
                            .onTapGesture {
                                tap(Asset(image: "", gridImage: nil, desc: ""))
                            }
                        Text("Remover\nItem")
                            .foregroundStyle(.gray4)
                            .font(.system(.caption, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 10)
                    .padding(.trailing, 5)
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Remover item")
                    .accessibilityHint("Toque duas vezes para remover o item selecionado.")
                }
                
                ForEach(Array(selectedTab.enumerated()), id: \.offset) { index, tab in
                    Rectangle()
                        .overlay {
                            if self.selectedCustomization == .face {
                                Image(tab.image)
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
                                    .accessibilityLabel(tab.desc)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                            
                            if self.selectedCustomization == .hair {
                                Image(tab.image)
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
                                    .colorMultiply(Color(assetHairColor.color))
                                    .saturation(1)
                                    .accessibilityLabel(tab.desc)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                            
                            if self.selectedCustomization == .top {
                                Image(tab.image)
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
                                    .colorMultiply(Color(assetTopColor.color))
                                    .saturation(1)
                                    .accessibilityLabel(tab.desc)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                            
                            if self.selectedCustomization == .bottom {
                                Image(tab.image)
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
                                    .colorMultiply(Color(assetBottomColor.color))
                                    .saturation(1)
                                    .accessibilityLabel(tab.desc)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                            
                            if self.selectedCustomization == .shoes {
                                Image(tab.image)
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
                                    .accessibilityLabel(tab.desc)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                            
                            if self.selectedCustomization == .accessories {
                                Image(tab.gridImage!)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 0.8
                                        } else {
                                            return length * 0.23
                                        }
                                    }
                                    .accessibilityLabel(tab.desc)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                        }
                        .aspectRatio(0.0013 * sizeScreen, contentMode: .fit)
                        .onTapGesture {
                            tap(tab)
                            lastTappedIndex = index
                        }
                }
            }
            .padding(.horizontal, 15)
            .background(Color.white)
            .foregroundStyle(.white)
        }
        .onChange(of: selectedCustomization) {
            lastTappedIndex = nil
        }
        .onChange(of: assetHairColor) {
            if lastTappedIndex != nil {
                tap(selectedTab[lastTappedIndex!])
            }
        }
        .onChange(of: assetTopColor) {
            if lastTappedIndex != nil {
                tap(selectedTab[lastTappedIndex!])
            }
        }
        .onChange(of: assetBottomColor) {
            if lastTappedIndex != nil {
                tap(selectedTab[lastTappedIndex!])
            }
        }
    }
}
