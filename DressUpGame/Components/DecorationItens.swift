//
//  DecorationItens.swift
//  DressUpGame
//
//  Created by USER on 28/04/26.
//

import SwiftUI

struct Sticker: Identifiable {
    let id = UUID()
    let image: UIImage
}


struct DecorationItens: View {
   
    @State var stickers = [
        Sticker(image: UIImage(resource: .sticker1)),
        Sticker(image: UIImage(resource: .sticker2)),
        Sticker(image: UIImage(resource: .sticker3)),
        Sticker(image: UIImage(resource: .sticker4)),
        Sticker(image: UIImage(resource: .sticker5)),
        Sticker(image: UIImage(resource: .sticker6)),
        Sticker(image: UIImage(resource: .sticker7)),
    ]

struct DecorationItens: View {
    
    @Binding var selectedOption: PostOptions
    
    var tap: (Int) -> Void
    
    let stickersImages = [1, 2, 3, 4, 5, 6, 7]
    let palettesImages = [0, 1, 2, 3, 4, 5]
    let bubblesImages = [1, 2, 3, 4]
    let textsImages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]
    
    let sizeScreen: CGFloat = UIScreen.main.bounds.width + UIScreen.main.bounds.height / UIScreen.main.bounds.width
    
    var selectedNumbers: [Int] {
        switch (selectedOption) {
        case .stickers:
            return stickersImages
        case .palettes:
            return palettesImages
        case .bubbles:
            return bubblesImages
        case .texts:
            return textsImages
        }
    }
    @State private var imgData: Data? = nil
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 1)) {
              if selectedOption == . stickers {
                    PhotoPicker() { data in
                        imgData = data
                    }
                    .frame(width: 100, height: 60)
                    .padding(.bottom, 50)
                    .padding(.leading, 30)
                }
              
                ForEach(selectedNumbers, id: \.self) { number in
                    Rectangle()
                        .overlay {
                            if self.selectedOption == .stickers {
                                Image("Sticker\(number)")
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 1
                                        } else {
                                            return length * 0.2
                                            
                                        }
                                    }
                                    .padding(.bottom, 0.02 * sizeScreen)
                            }
                            
                            if self.selectedOption == .palettes {
                                Image("Background\(number)")
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
                                Image("Bubble\(number)")
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
                                Image("Alphabet\(number)")
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
                            tap(number)
                        }
                }
            }
            .border(Color.borderPink, width: 1)
            .background(Color.white)
            .foregroundStyle(.white)
        }
    }
}
