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
    
    @State var faces = [
        Asset(image: UIImage(resource: .doll1), gridImage: nil, description: "Boneca com traços femininos de tom claro"),
        Asset(image: UIImage(resource: .doll2), gridImage: nil, description: "Boneca com traços masculinos de tom claro"),
        Asset(image: UIImage(resource: .doll7), gridImage: nil, description: "Boneca com traços femininos de tom médio claro"),
        Asset(image: UIImage(resource: .doll8), gridImage: nil, description: "Boneca com traços masculinos de tom médio claro"),
        Asset(image: UIImage(resource: .doll3), gridImage: nil, description: "Boneca com traços femininos de tom médio escuro"),
        Asset(image: UIImage(resource: .doll4), gridImage: nil, description: "Boneca com traços masculinos de tom médio escuro"),
        Asset(image: UIImage(resource: .doll5), gridImage: nil, description: "Boneca com traços femininos de tom escuro"),
        Asset(image: UIImage(resource: .doll6), gridImage: nil, description: "Boneca com traços masculinos de tom escuro")
    ]
    
    var hairs: [Asset] {
        [
            Asset(image: UIImage(resource: .cabelo1), gridImage: nil, description: "Cabelo \(assetHairColor.name) masculino curto e ondulado"),
            Asset(image: UIImage(resource: .cabelo2), gridImage: nil, description: "Cabelo \(assetHairColor.name) masculino curto, liso com franjas emoldurando o rosto"),
            Asset(image: UIImage(resource: .cabelo3), gridImage: nil, description: "Cabelo \(assetHairColor.name) masculino curto, liso sem franja"),
            Asset(image: UIImage(resource: .cabelo4), gridImage: nil, description: "Cabelo \(assetHairColor.name) masculino curto cacheado com suíças descendo até a orelha"),
            Asset(image: UIImage(resource: .cabelo5), gridImage: nil, description: "Cabelo \(assetHairColor.name) masculino curto, crespo"),
            Asset(image: UIImage(resource: .cabelo6), gridImage: nil, description: "Cabelo \(assetHairColor.name) feminino médio, liso com franja reta"),
            Asset(image: UIImage(resource: .cabelo7), gridImage: nil, description: "Cabelo \(assetHairColor.name) feminino longo, liso com franja reta"),
            Asset(image: UIImage(resource: .cabelo8), gridImage: nil, description: "Cabelo \(assetHairColor.name) feminino crespo com franja emoldurando o rosto e dois coques nas laterais."),
            Asset(image: UIImage(resource: .cabelo9), gridImage: nil, description: "Cabelo \(assetHairColor.name) feminino curto, liso com franja reta"),
            Asset(image: UIImage(resource: .cabelo10), gridImage: nil, description: "Cabelo \(assetHairColor.name) feminino curto, liso com franja lateral"),
            Asset(image: UIImage(resource: .cabelo11), gridImage: nil, description: "Cabelo \(assetHairColor.name) feminino longo, ondulado com franja curta repicada"),
            Asset(image: UIImage(resource: .cabelo12), gridImage: nil, description: "Cabelo \(assetHairColor.name) feminino longo cacheado"),
            Asset(image: UIImage(resource: .cabelo13), gridImage: nil, description: "Cabelo \(assetHairColor.name) feminino curto cacheado")
        ]
    }
    
    var tops: [Asset] {
        [
            Asset(image: UIImage(resource: .top1), gridImage: nil, description: "Camisa \(assetTopColor.name) larga de tamanho médio, manga média e gola redonda"),
            Asset(image: UIImage(resource: .top2), gridImage: nil, description: "Camisa \(assetTopColor.name)justa de tamanho médio, manga longa e gola redonda"),
            Asset(image: UIImage(resource: .top3), gridImage: nil, description: "Camisa \(assetTopColor.name)regata justa, curta e de gola redonda"),
            Asset(image: UIImage(resource: .top4), gridImage: nil, description: "Camiseta \(assetTopColor.name) de botões longa de mangas longas e detalhe na gola"),
            Asset(image: UIImage(resource: .top5), gridImage: nil, description: "Camisa \(assetTopColor.name) larga e curta, com manga média e gola redonda"),
            Asset(image: UIImage(resource: .top6), gridImage: nil, description: "Moletom \(assetTopColor.name) largo de mangas longas, detalhe de bolso frontal e gola com capuz"),
            Asset(image: UIImage(resource: .top7), gridImage: nil, description: "Vestido \(assetTopColor.name) de tamanho médio, com caimento aberto na parte de baixo e justo na parte de cima, com detalhe de amarração no pescoço"),
            Asset(image: UIImage(resource: .top8), gridImage: nil, description: "Camisa \(assetTopColor.name) regata com caimento solto e detalhe drapeado no busto"),
            Asset(image: UIImage(resource: .top9), gridImage: nil, description: "Camisa \(assetTopColor.name) ombro-a-ombro com caimento solto"),
            Asset(image: UIImage(resource: .top10), gridImage: nil, description: "Camisa \(assetTopColor.name) justa de tamanho médio, manga longa com listras horizontais, gola redonda e desenho de coelho no centro")
        ]
    }
    
    var bottoms: [Asset] {
        [
            Asset(image: UIImage(resource: .bottom1), gridImage: nil, description: "Calça jeans \(assetBottomColor.name) larga com bolsos laterais"),
            Asset(image: UIImage(resource: .bottom2), gridImage: nil, description: "Saia \(assetBottomColor.name) curta com detalhe de amarração lateral"),
            Asset(image: UIImage(resource: .bottom3), gridImage: nil, description: "Bermuda cargo \(assetBottomColor.name) com bolsos grandes na lateral"),
            Asset(image: UIImage(resource: .bottom4), gridImage: nil, description: "Saia jeans \(assetBottomColor.name) curta com bolsos laterais"),
            Asset(image: UIImage(resource: .bottom5), gridImage: nil, description: "Calça jeans \(assetBottomColor.name) de cintura baixa e bolsos laterais"),
            Asset(image: UIImage(resource: .bottom6), gridImage: nil, description: "Calça de pijama \(assetBottomColor.name) com bolsos laterais e detalhes de costura"),
            Asset(image: UIImage(resource: .bottom7), gridImage: nil, description: "Short curto de pijama \(assetBottomColor.name) com bolsos laterais e detalhes de costura"),
            Asset(image: UIImage(resource: .bottom8), gridImage: nil, description: "Saia curta \(assetBottomColor.name) de babados bufante com detalhe no cós"),
            Asset(image: UIImage(resource: .bottom9), gridImage: nil, description: "Saia longa \(assetBottomColor.name) com detalhe de amarração na cintura")
        ]
    }
    
    @State var shoes = [
        Asset(image: UIImage(resource: .shoes1), gridImage: nil, description: "Sapato unissex de cano baixo, bico arredondado, cadarços brancos e uma listra branca vertical na lateral."),
        Asset(image: UIImage(resource: .shoes2), gridImage: nil, description: "Sapato unissex de cano alto, bico arredondado e cadarços brancos"),
        Asset(image: UIImage(resource: .shoes3), gridImage: nil, description: "Sapatilha feminina de bico arredondado, solado grosso e fechada na parte de cima, deixando os dedos visíveis"),
        Asset(image: UIImage(resource: .shoes4), gridImage: nil, description: "Bota unissex de cano alto com detalhes que remetem correias "),
        Asset(image: UIImage(resource: .shoes5), gridImage: nil, description: "Sapatilha feminina de bico arredondado, salto tamanco, detalhe de fitas e meia")
    ]
    
    @State var accessories = [
        Asset(image: UIImage(resource: .acessorio1), gridImage: UIImage(resource: .gridAcessorio1), description: "Bolsa carteiro de lado com alça grossa"),
        Asset(image: UIImage(resource: .acessorio2), gridImage: UIImage(resource: .gridAcessorio2), description: "Bolsa carteiro de lado com pingentes pendurados"),
        Asset(image: UIImage(resource: .acessorio3), gridImage: UIImage(resource: .gridAcessorio3), description: "Cinto grosso com uma estrela no centro e detalhe de teclas de piano"),
        Asset(image: UIImage(resource: .acessorio4), gridImage: UIImage(resource: .gridAcessorio4), description: "Cinto grosso de ilhós prata"),
        Asset(image: UIImage(resource: .acessorio5), gridImage: UIImage(resource: .gridAcessorio5), description: "Brincos pequenos arredondados"),
        Asset(image: UIImage(resource: .acessorio6), gridImage: UIImage(resource: .gridAcessorio6), description: "Brincos pequenos de pingente"),
        Asset(image: UIImage(resource: .acessorio7), gridImage: UIImage(resource: .gridAcessorio7), description: "Bracelete duplo"),
        Asset(image: UIImage(resource: .acessorio8), gridImage: UIImage(resource: .gridAcessorio8), description: "Bracelete com detalhes de pedras encrostadas"),
        Asset(image: UIImage(resource: .acessorio9), gridImage: UIImage(resource: .gridAcessorio9), description: "Relógio de ponteiro fino"),
        Asset(image: UIImage(resource: .acessorio10), gridImage: UIImage(resource: .gridAcessorio10), description: "Óculos retangulares simples"),
        Asset(image: UIImage(resource: .acessorio11), gridImage: UIImage(resource: .gridAcessorio11), description: "Óculos escuros com detalhe de estrela na lateral"),
        Asset(image: UIImage(resource: .acessorio12), gridImage: UIImage(resource: .gridAcessorio12), description: "Óculos estilo gatinho"),
        Asset(image: UIImage(resource: .acessorio13), gridImage: UIImage(resource: .gridAcessorio13), description: "Meias grossas que cobrem a região do tornozelo até o joelho com detalhe de laço nas laterais")
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
                        Text("Remover\nItem")
                            .foregroundStyle(.gray4)
                            .font(.system(.caption, weight: .semibold))
                            .multilineTextAlignment(.center)
                    }
                    .padding(.horizontal, 10)
                    .padding(.trailing, 5)
                    .accessibilityLabel("Remover item")
                    .accessibilityHint("Toque duas vezes para remover o item selecionado.")
                    .onTapGesture {
                        tap(Asset(image: UIImage(), gridImage: nil, description: ""))
                    }
                }
                
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
                                    .colorMultiply(assetHairColor.color)
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
                                    .colorMultiply(assetTopColor.color)
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
                                    .colorMultiply(assetBottomColor.color)
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
                                Image(uiImage: tab.gridImage!)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 0.8
                                        } else {
                                            return length * 0.23
                                        }
                                    }
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
            .padding(.horizontal, 15)
            .background(Color.white)
            .foregroundStyle(.white)
        }
    }
}
