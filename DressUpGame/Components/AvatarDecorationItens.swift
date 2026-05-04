//
//  DecorationItens.swift
//  DressUpGame
//
//  Created by USER on 28/04/26.
//
import SwiftUI

struct AvatarDecorationItens: View {
    
    @Binding var selectedCustomization: AvatarOptions

    var tap: (Int) -> Void

    let faceImages = [1, 2]
    let hairImages = [1, 2, 3, 4, 5, 6, 7, 8]
    let topImages = [1, 2, 3, 4, 5, 6, 7]
    let bottomImages = [1, 2, 3]
    let shoesImages = [1, 2, 3, 4]
    let accessoriesImages = [1, 2, 3, 4, 5, 6, 7, 8, 9 , 10, 11, 12]

    
    var selectedTab: [Int] {
        switch (selectedCustomization) {
        case .face:
            return faceImages
        case .hair:
            return hairImages
        case .top:
            return topImages
        case .bottom:
            return bottomImages
        case .shoes:
            return shoesImages
        case .accessories:
            return accessoriesImages
        }
        
    }
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 1)) {
                ForEach(selectedTab, id: \.self) { tab in
                    Rectangle()
                        .overlay {
                            if self.selectedCustomization == .face {
                                Image("Doll\(tab)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 320)
                                    .padding(.top, 150)
                            }
                            if self.selectedCustomization == .hair {
                                Image("Cabelo\(tab)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 280)
                                    .padding(.top, 100)
                            }
                            if self.selectedCustomization == .top {
                                Image("Top\(tab)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 320)
                                    .padding(.top, 25)
                            }
                            if self.selectedCustomization == .bottom {
                                Image("Bottom\(tab)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 250)
                                    .padding(.bottom, 120)
                            }
                            if self.selectedCustomization == .shoes {
                                Image("Shoes\(tab)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 320)
                                    .padding(.bottom, 280)
                            }
                            if self.selectedCustomization == .accessories {
                                Image("Acessorio\(tab)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 320)
                                    .padding(.bottom, 3)
                            }
                            }
                        .aspectRatio(1, contentMode: .fit)
                        .onTapGesture {
                            tap(tab)
                        }
                }
            }
            .foregroundStyle(.white)
            .frame(height: 200)
        }
        
    
        
    }
    
}
