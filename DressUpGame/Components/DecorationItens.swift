//
//  DecorationItens.swift
//  DressUpGame
//
//  Created by USER on 28/04/26.
//

import SwiftUI
import PhotosUI


struct Sticker: Identifiable {
    let id = UUID()
    let image: UIImage
}

struct DecorationItens: View {
    @Binding var selectedOption: PostOptions
    @State private var showingAlert = false
    @State private var authorizationStatus = PHAuthorizationStatus.notDetermined
    var tap: (Asset) -> Void
    
    @State var stickers = [
        Asset(image: "Sticker1", gridImage: nil, desc: ""),
        Asset(image: "Sticker2", gridImage: nil, desc: ""),
        Asset(image: "Sticker3", gridImage: nil, desc: ""),
        Asset(image: "Sticker4", gridImage: nil, desc: ""),
        Asset(image: "Sticker5", gridImage: nil, desc: ""),
        Asset(image: "Sticker6", gridImage: nil, desc: ""),
        Asset(image: "Sticker7", gridImage: nil, desc: "")
    ]

    @State var palettes = [
        Asset(image: "Background0", gridImage: nil, desc: "Papel de parede com degradê que transiciona entre as cores rosa e branco com formas hexagonais em branco"),
        Asset(image: "Background1", gridImage: nil, desc: "Papel de parede com degradê que transiciona entre tons de rosa com bolinhas pequenas em rosa"),
        Asset(image: "Background2", gridImage: nil, desc: "Papel de parede com degradê que transiciona entre cores lilás e branco com formas hexagonais em branco"),
        Asset(image: "Background3", gridImage: nil, desc: "Papel de parede amarelo com bolinhas pequenas em rosa pêssego"),
        Asset(image: "Background4", gridImage: nil, desc: "Papel de parede rosa com linhas diagonais rosa escuro"),
        Asset(image: "Background5", gridImage: nil, desc: "Papel de parede azul com formas de estrela de quatro pontas azuis escuro"),
        Asset(image: "Background6", gridImage: nil, desc: "Papel de parede verde menta com bolinhas pequenas em verde escuro"),
        Asset(image: "Background7", gridImage: nil, desc: "Papel de parede com degradê que transiciona entre tons de rosa com linhas verticais em rosa escuro"),
        Asset(image: "Background8", gridImage: nil, desc: "Papel de parede com degradê que transiciona entre tons de lilás com quadriculado em lilás escuro")
    ]

    @State var bubbles = [
        Asset(image: "Bubble1", gridImage: nil, desc: ""),
        Asset(image: "Bubble2", gridImage: nil, desc: ""),
        Asset(image: "Bubble3", gridImage: nil, desc: ""),
        Asset(image: "Bubble4", gridImage: nil, desc: "")
    ]

    @State var texts = [
        Asset(image: "Alphabet1", gridImage: nil, desc: ""),
        Asset(image: "Alphabet2", gridImage: nil, desc: ""),
        Asset(image: "Alphabet3", gridImage: nil, desc: ""),
        Asset(image: "Alphabet4", gridImage: nil, desc: ""),
        Asset(image: "Alphabet5", gridImage: nil, desc: ""),
        Asset(image: "Alphabet6", gridImage: nil, desc: ""),
        Asset(image: "Alphabet7", gridImage: nil, desc: ""),
        Asset(image: "Alphabet8", gridImage: nil, desc: ""),
        Asset(image: "Alphabet9", gridImage: nil, desc: ""),
        Asset(image: "Alphabet10", gridImage: nil, desc: ""),
        Asset(image: "Alphabet11", gridImage: nil, desc: ""),
        Asset(image: "Alphabet12", gridImage: nil, desc: ""),
        Asset(image: "Alphabet13", gridImage: nil, desc: ""),
        Asset(image: "Alphabet14", gridImage: nil, desc: ""),
        Asset(image: "Alphabet15", gridImage: nil, desc: ""),
        Asset(image: "Alphabet16", gridImage: nil, desc: ""),
        Asset(image: "Alphabet17", gridImage: nil, desc: ""),
        Asset(image: "Alphabet18", gridImage: nil, desc: ""),
        Asset(image: "Alphabet19", gridImage: nil, desc: ""),
        Asset(image: "Alphabet20", gridImage: nil, desc: ""),
        Asset(image: "Alphabet21", gridImage: nil, desc: ""),
        Asset(image: "Alphabet22", gridImage: nil, desc: ""),
        Asset(image: "Alphabet23", gridImage: nil, desc: ""),
        Asset(image: "Alphabet24", gridImage: nil, desc: ""),
        Asset(image: "Alphabet25", gridImage: nil, desc: ""),
        Asset(image: "Alphabet26", gridImage: nil, desc: ""),
        Asset(image: "Alphabet27", gridImage: nil, desc: ""),
        Asset(image: "Alphabet28", gridImage: nil, desc: ""),
        Asset(image: "Alphabet29", gridImage: nil, desc: ""),
        Asset(image: "Alphabet30", gridImage: nil, desc: ""),
        Asset(image: "Alphabet31", gridImage: nil, desc: ""),
        Asset(image: "Alphabet32", gridImage: nil, desc: ""),
        Asset(image: "Alphabet33", gridImage: nil, desc: ""),
        Asset(image: "Alphabet34", gridImage: nil, desc: "")
    ]
    
    let sizeScreen: CGFloat = UIScreen.main.bounds.width + UIScreen.main.bounds.height / UIScreen.main.bounds.width
    let sizeScreenHeight: CGFloat = UIScreen.main.bounds.height
    
    var selectedNumbers: [Asset] {
        switch (selectedOption) {
        case .stickers:
            return stickers
        case .palettes:
            return palettes
        case .bubbles:
            return bubbles
        case .texts:
            return texts
        }
    }
    
    @State private var text: String = ""
    @State var isShowingCustomStickerPicker = false
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 1)) {
                if selectedOption == .stickers {
                    Button (action: {
                        isShowingCustomStickerPicker = true
                        PHPhotoLibrary.requestAuthorization(for: .addOnly) {
                            status in authorizationStatus = status
                            if status == .denied {
                                showingAlert = true
                            }
                        }
                    }) {
                        VStack (spacing: 10) {
                            Image("AddStickerButton")
                                .resizable()
                                .scaledToFit()
                                .font(.body)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.primaryPink)
                            Text("Add Sticker")
                                .foregroundStyle(.primaryPink)
                                .font(.system(.body, weight: .semibold))
                        }
                    }
                    .accessibilityElement(children: .ignore)
                    .accessibilityHidden(true)
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 1
                        } else {
                            return length * 0.4
                        }
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert (
                            title: Text("Permission denied."),
                            message: Text("To use this feature, you must grant access to your photo gallery."),
                            dismissButton: .default(Text("Allow")) {
                                if let settingURL = URL(string: UIApplication.openSettingsURLString),
                                   UIApplication.shared.canOpenURL(settingURL) {
                                    UIApplication.shared.open(settingURL)
                                }
                            }
                        )
                    }
                }
                ForEach(selectedNumbers, id: \.self) { number in
                    Rectangle()
                        .overlay {
                            if self.selectedOption == .stickers {
                                Image(number.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 1
                                        } else {
                                            return length * 0.2
                                        }
                                    }
                                    .sheet(isPresented: $isShowingCustomStickerPicker) {
//                                        PhotoSticker(showingAlert: $showingAlert) {
//                                            stickers.insert(Asset(image: $0, gridImage: nil, description: ""), at: 0)
//                                        }
                                    }
                                    .accessibilityHidden(true)
                            }
                            
                            if self.selectedOption == .palettes {
                                Image(number.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 1.5
                                        } else {
                                            return length * 5
                                        }
                                    }
                                    .padding(.bottom, 0.02 * sizeScreen)
                                    .accessibilityLabel(number.desc)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                            
                            if self.selectedOption == .bubbles {
                                Image(number.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 2
                                        } else {
                                            return length * 0.25
                                        }
                                    }
                                    .padding(.bottom, 0.02 * sizeScreen)
                                    .accessibilityHidden(true)
                            }
                            
                            if self.selectedOption == .texts {
                                Image(number.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 2
                                        } else {
                                            return length * 0.25
                                        }
                                    }
                                    .padding(.bottom, 0.02 * sizeScreen)
                                    .accessibilityHidden(true)
                            }
                        }
                        .aspectRatio(0.7, contentMode: .fit)
                        .onTapGesture {
                            tap(number)
                        }
                }
            }
            .border(Color.borderPink, width: 0.5)
            .background(Color.white)
            .foregroundStyle(.white)
        }
    }
}
