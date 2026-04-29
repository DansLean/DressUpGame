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

    var tap: (Image) -> Void

    let stickersImages = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let palettesImages = [11, 13, 14, 15, 16, 17, 18, 19, 20]
    let bubblesImages = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    let textsImages = [11, 12, 13, 14, 15, 16, 17, 18, 19, 20]

    
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
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 2)) {
                ForEach(selectedNumbers, id: \.self) { number in
                    Rectangle()
                        .overlay {
                            Image("\(number)")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                
                                
                            }
                        
                        .aspectRatio(1, contentMode: .fit)
                        .onTapGesture {
                            tap(Image("\(number)"))
                        
                        }
                        
                }
                
            }
            .foregroundStyle(.white)
            
            
            

        }
        
    
        
    }
    
}
