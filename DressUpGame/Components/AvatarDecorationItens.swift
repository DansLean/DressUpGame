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
    
    let faceImages = [1, 2, 3, 4, 5, 6, 7, 8]
    let hairImages = [1, 2, 3, 4, 5, 6, 7, 8]
    let topImages = [1, 2, 3, 4, 5, 6, 7]
    let bottomImages = [1, 2, 3]
    let shoesImages = [1, 2, 3, 4]
    let accessoriesImages = [1, 2, 3, 4, 5, 6, 7, 8, 9 , 10, 11, 12]
    
    let sizeScreen: CGFloat = UIScreen.main.bounds.width + UIScreen.main.bounds.height / UIScreen.main.bounds.width
    
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
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 2
                                        } else {
                                            return length * 0.25
                                            
                                        }
                                    }
                                    .padding(.top, 0.45 * sizeScreen)
                            }
                            if self.selectedCustomization == .hair {
                                Image("Cabelo\(tab)")
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 8
                                        } else {
                                            return length * 0.25
                                            
                                        }
                                    }
                                
                                    .padding(.top, 0.65 * sizeScreen)
                            }
                            if self.selectedCustomization == .top {
                                Image("Top\(tab)")
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 2
                                        } else {
                                            return length * 0.5
                                            
                                        }
                                    }
                                    .padding(.top, 0.25 * sizeScreen)
                            }
                            if self.selectedCustomization == .bottom {
                                Image("Bottom\(tab)")
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
                            }
                            if self.selectedCustomization == .shoes {
                                Image("Shoes\(tab)")
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
                            }
                            if self.selectedCustomization == .accessories {
                                Image("Acessorio\(tab)")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 200, height: 320)
                                    .padding(.bottom, 3)
                            }
                        }
                        .aspectRatio(0.0013 * sizeScreen, contentMode: .fit)
                        .onTapGesture {
                            tap(tab)
                        }
                }
            }
            .background(Color.white)
            .foregroundStyle(.white)
        }
    }
}
