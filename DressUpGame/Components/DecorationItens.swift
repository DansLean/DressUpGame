//
//  DecorationItens.swift
//  DressUpGame
//
//  Created by USER on 28/04/26.
//

import SwiftUI


struct Asset: Hashable {
    let id = UUID()
    let image: UIImage
}

struct DecorationItens: View {
    
    @Binding var selectedOption: PostOptions
    
    var tap: (UIImage) -> Void
    
    @State var stickers = [
        Asset(image: UIImage(resource: .sticker1)),
        Asset(image: UIImage(resource: .sticker2)),
        Asset(image: UIImage(resource: .sticker3)),
        Asset(image: UIImage(resource: .sticker4)),
        Asset(image: UIImage(resource: .sticker5)),
        Asset(image: UIImage(resource: .sticker6)),
        Asset(image: UIImage(resource: .sticker7)),
    ]
    
    @State var palettes = [
        Asset(image: UIImage(resource: .background0)),
        Asset(image: UIImage(resource: .background1)),
        Asset(image: UIImage(resource: .background2)),
        Asset(image: UIImage(resource: .background3)),
        Asset(image: UIImage(resource: .background4)),
        Asset(image: UIImage(resource: .background5)),
    ]
    
    
    @State var bubbles = [
        Asset(image: UIImage(resource: .bubble1)),
        Asset(image: UIImage(resource: .bubble2)),
        Asset(image: UIImage(resource: .bubble3)),
        Asset(image: UIImage(resource: .bubble4)),
    ]
    
    @State var texts = [
        Asset(image: UIImage(resource: .alphabet1)),
        Asset(image: UIImage(resource: .alphabet2)),
        Asset(image: UIImage(resource: .alphabet3)),
        Asset(image: UIImage(resource: .alphabet4)),
        Asset(image: UIImage(resource: .alphabet5)),
        Asset(image: UIImage(resource: .alphabet6)),
        Asset(image: UIImage(resource: .alphabet7)),
        Asset(image: UIImage(resource: .alphabet8)),
        Asset(image: UIImage(resource: .alphabet9)),
        Asset(image: UIImage(resource: .alphabet10)),
        Asset(image: UIImage(resource: .alphabet11)),
        Asset(image: UIImage(resource: .alphabet12)),
        Asset(image: UIImage(resource: .alphabet13)),
        Asset(image: UIImage(resource: .alphabet14)),
        Asset(image: UIImage(resource: .alphabet15)),
        Asset(image: UIImage(resource: .alphabet16)),
        Asset(image: UIImage(resource: .alphabet17)),
        Asset(image: UIImage(resource: .alphabet18)),
        Asset(image: UIImage(resource: .alphabet19)),
        Asset(image: UIImage(resource: .alphabet20)),
        Asset(image: UIImage(resource: .alphabet21)),
        Asset(image: UIImage(resource: .alphabet22)),
        Asset(image: UIImage(resource: .alphabet23)),
        Asset(image: UIImage(resource: .alphabet24)),
        Asset(image: UIImage(resource: .alphabet25)),
        Asset(image: UIImage(resource: .alphabet26)),
        Asset(image: UIImage(resource: .alphabet27)),
        Asset(image: UIImage(resource: .alphabet28)),
        Asset(image: UIImage(resource: .alphabet29)),
        Asset(image: UIImage(resource: .alphabet30)),
    ]
    
    let sizeScreen: CGFloat = UIScreen.main.bounds.width + UIScreen.main.bounds.height / UIScreen.main.bounds.width
    
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
    
    @State var isShowingCustomStickerPicker = false
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 1)) {
                if selectedOption == .stickers {
                    Button {
                        isShowingCustomStickerPicker = true
                    } label: {
                        Image(systemName: "photo.badge.plus.fill")
                            .resizable()
                            .scaledToFit()
                            .font(.body)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.primaryPink)
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 1
                        } else {
                            return length * 0.4
                        }
                    }
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
                                        PhotoSticker {
                                            stickers.insert(Asset(image: $0), at: 0)
                                        }
                                    }
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
                            }
                        }
                        .aspectRatio(0.7, contentMode: .fit)
                        .onTapGesture {
                            tap(number.image)
                        }
                    
                }
            }
            .border(Color.borderPink, width: 0.5)
            .background(Color.white)
            .foregroundStyle(.white)
        }
    }
}
