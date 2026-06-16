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
        Asset(image: UIImage(resource: .sticker1), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .sticker2), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .sticker3), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .sticker4), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .sticker5), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .sticker6), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .sticker7), gridImage: nil, description: "")
    ]
    
    @State var palettes = [
        Asset(image: UIImage(resource: .background0), gridImage: nil, description: "Papel de parede com degradê que transiciona entre as cores rosa e branco com formas hexagonais em branco"),
        Asset(image: UIImage(resource: .background1), gridImage: nil, description: "Papel de parede com degradê que transiciona entre tons de rosa com bolinhas pequenas em rosa"),
        Asset(image: UIImage(resource: .background2), gridImage: nil, description: "Papel de parede com degradê que transiciona entre cores lilás e branco com formas hexagonais em branco"),
        Asset(image: UIImage(resource: .background3), gridImage: nil, description: "Papel de parede amarelo com bolinhas pequenas em rosa pêssego"),
        Asset(image: UIImage(resource: .background4), gridImage: nil, description: "Papel de parede rosa com linhas diagonais rosa escuro"),
        Asset(image: UIImage(resource: .background5), gridImage: nil, description: "Papel de parede azul com formas de estrela de quatro pontas azuis escuro"),
        Asset(image: UIImage(resource: .background6), gridImage: nil, description: "Papel de parede verde menta com bolinhas pequenas em verde escuro"),
        Asset(image: UIImage(resource: .background7), gridImage: nil, description: "Papel de parede com degradê que transiciona entre tons de rosa com linhas verticais em rosa escuro"),
        Asset(image: UIImage(resource: .background8), gridImage: nil, description: "Papel de parede com degradê que transiciona entre tons de lilás com quadriculado em lilás escuro")
    ]
    
    @State var bubbles = [
        Asset(image: UIImage(resource: .bubble1), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .bubble2), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .bubble3), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .bubble4), gridImage: nil, description: "")
    ]
    
    @State var texts = [
        Asset(image: UIImage(resource: .alphabet1), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet2), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet3), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet4), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet5), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet6), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet7), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet8), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet9), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet10), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet11), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet12), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet13), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet14), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet15), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet16), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet17), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet18), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet19), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet20), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet21), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet22), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet23), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet24), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet25), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet26), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet27), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet28), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet29), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet30), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet31), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet32), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet33), gridImage: nil, description: ""),
        Asset(image: UIImage(resource: .alphabet34), gridImage: nil, description: "")
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
                    .accessibilityHidden(true)
                }
                
                ForEach(selectedNumbers, id: \.self) { number in
                    Rectangle()
                        .overlay {
                            if self.selectedOption == .stickers {
                                Image(uiImage: number.image)
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
                                        PhotoSticker(showingAlert: $showingAlert) {
                                            stickers.insert(Asset(image: $0, gridImage: nil, description: ""), at: 0)
                                        }
                                    }
                                    .accessibilityLabel(number.description)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                                    .accessibilityHidden(true)
                            }
                            
                            if self.selectedOption == .palettes {
                                Image(uiImage: number.image)
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
                                    .accessibilityLabel(number.description)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                            }
                            
                            if self.selectedOption == .bubbles {
                                Image(uiImage: number.image)
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
                                    .accessibilityLabel(number.description)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
                                    .accessibilityHidden(true)
                            }
                            
                            if self.selectedOption == .texts {
                                Image(uiImage: number.image)
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
                                    .accessibilityLabel(number.description)
                                    .accessibilityHint("Toque duas vezes para selecionar esse item.")
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
