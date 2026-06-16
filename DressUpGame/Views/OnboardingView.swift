//
//  OnboardingView.swift
//  DressUpGame
//
//  Created by Vírna Carvalho on 16/06/26.
//

import Foundation
import SwiftUI

struct OnboardingItens: Identifiable {
    var id = UUID()
    var image: String
    var title: String
    var description: String
}

let showingImages: [OnboardingItens] = [
    OnboardingItens(image: "onBoarding-image1", title: "Personalize seu avatar", description: "Deixe a boneca com a sua cara usando nossas roupas e acessórios estilosos!"),
    OnboardingItens(image: "onBoarding-image2", title: "Customize seu post", description: "Decore seus posts com adesivos e crie os seus a partir da galeria."),
    OnboardingItens(image: "onBoarding-image3", title: "Compartilhe sua criação", description: "Mostre seu estilo e personalidade para amigos e seguidores!"),
    
]

struct OnboardingView: View {
    var itens : OnboardingItens
    
    @State private var isAnimating: Bool = false
    var body: some View {
        VStack(alignment: .center)  {
            VStack(alignment: .center) {
                Image(itens.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.65
                        } else {
                            return length * 0.85
                        }
                    }
                    .accessibilityHidden(true)
                    
                
                VStack(alignment: .center) {
                    Text(itens.title)
                        .font(.title)
                        .bold()
                        .foregroundColor(.primaryPink)
                        .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                            if axis == .vertical {
                                return length * 0.05
                            } else {
                                return length
                            }
                        }
                        .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                            if axis == .vertical {
                                return length * 0.05
                            } else {
                                return length * 0.8
                            }
                        }
                    Text(itens.description)
                        .font(.body)
                        .foregroundColor(.gray)
                    
                    
                    
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.2
                    } else {
                        return length * 0.8
                    }
                }
                HStack(alignment: .center, spacing: 110) {

                    NavigationLink(destination: CreateAvatarView()) {
                        Button {
                            
                        } label: {
                            Text("Pular")
                                .padding(15)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .foregroundColor(.primaryPink)
                                .bold()

                        }
                        .background(.primaryPink)
                        .opacity(0.3)
                        .cornerRadius(100)
                        .shadow(radius: 2, y: 2)
                    }
                    
                    NavigationLink(destination: CreateAvatarView()) {
                        Button {
                            
                        } label: {
                            Text("Próximo")
                                .padding(15)
                                .padding(.leading, 10)
                                .padding(.trailing, 10)
                                .foregroundColor(.white)
                                .bold()

                        }
                        .background(.primaryPink)
                        .cornerRadius(100)
                        .shadow(radius: 2, y: 2)
                    }

                    
                    
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.1
                    } else {
                        return length
                    }
                }
                
            }
            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                if axis == .vertical {
                    return length * 1
                } else {
                    return length
                }
            }
            
            
            
        }
        .background(
            LinearGradient(gradient: Gradient(colors: [.borderPink, .white]), startPoint: .top, endPoint: .bottom)
        )
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
        
    }
}




#Preview {
    OnboardingView(itens: showingImages[0])
}
