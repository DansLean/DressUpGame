//
//  DecorationItens.swift
//  DressUpGame
//
//  Created by USER on 28/04/26.
//
import SwiftUI

struct DecorationItens: View {
    //    func tap(quemfoiclicado) {
    //
    //    }
    
    @Binding var selectedOption: PostOptions

    var tap: (Int) -> Void

    let stickersImages = [1, 2, 3, 4, 5, 6, 7]
    let palettesImages = [0, 1, 2, 3, 4, 5]
    let bubblesImages = [1, 2, 3, 4]
    let textsImages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]

    
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
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 1)) {
                ForEach(selectedNumbers, id: \.self) { number in
                    Rectangle()
                        .overlay {
                            if self.selectedOption == .stickers {
                                Image("Sticker\(number)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .padding(.bottom, 50)
                                    
                            }
                            if self.selectedOption == .palettes {
                                Image("Background\(number)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: .infinity, minHeight: 500)
                                    .padding(.bottom, 50)
                            }
                            if self.selectedOption == .bubbles {
                                Image("Bubble\(number)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 60, height: 60)
                                    .padding(.bottom, 50)
                            }
                            if self.selectedOption == .texts {
                                Image("Alphabet\(number)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 100, height: 100)
                                    .padding(.bottom, 50)
                            }

                            
                                
                            }
                        .aspectRatio(0.7, contentMode: .fit)
                        .onTapGesture {
                            tap(number)
                            print("teste")
                        }
                        
                }
                
            }
            .border(Color.borderPink, width: 1)
            .background(Color.white)
            .foregroundStyle(.white)
            .frame(height: 200)
            
            
            

        }
        
    
        
    }
    
}
