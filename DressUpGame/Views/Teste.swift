//
//  Teste.swift
//  DressUpGame
//
//  Created by Vírna Carvalho on 16/06/26.
//


import Foundation
import SwiftUI

struct Teste: View {
    var itens: [OnboardingItens] = showingImages
    
    var body: some View {
        TabView{
            ForEach(itens[0...2]){
                OnboardingView(itens: $0)
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .ignoresSafeArea()
        //stepper(?)
    }

}

#Preview {
    Teste()
}
