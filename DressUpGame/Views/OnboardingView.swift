//
//  OnboardingView.swift
//  DressUpGame
//
//  Created by Vírna Carvalho on 16/06/26.
//

import Foundation
import SwiftUI


enum OnboardingPage: Int, CaseIterable {
    case avatar
    case post
    case share
    
    var title: String {
        switch self {
        case .avatar:
            return "Personalize seu avatar"
        case .post:
            return "Customize seu post"
        case .share:
            return "Compartilhe sua criação"
        }
    }
    
    var image: String {
        switch self {
        case .avatar:
            return "onBoarding-image1"
        case .post:
            return "onBoarding-image2"
        case .share:
            return "onBoarding-image3"
        }
    }
    
    var description: String {
        switch self {
        case .avatar:
            return "Deixe a boneca com a sua cara usando nossas roupas e acessórios estilosos!"
        case .post:
            return "Decore seus posts com adesivos e crie os seus a partir da galeria."
        case .share:
            return "Mostre seu estilo e personalidade para amigos e seguidores!"
        }
    }
}

struct OnboardingView: View {
    @Binding var isFirstLaunch: Bool
    
    @State private var currentPage = 0
    @State private var trackingProgress: CGFloat = 0.0
    @State private var isAnimating: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                TabView(selection: $currentPage) {
                    ForEach(OnboardingPage.allCases, id: \.rawValue) { page in
                        getPageView(for: page)
                            .tag(page.rawValue)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .animation(.spring(), value: currentPage)
                
                VStack {
                    Text("")
                        .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                            if axis == .vertical {
                                return length * 0.18
                            } else {
                                return length
                            }
                        }
                        .accessibilityHidden(true)
                    
                    HStack(spacing: 12) {
                        ForEach(0..<OnboardingPage.allCases.count, id: \.self) {
                            index in
                            Circle()
                                .fill(currentPage == index ? Color.primaryPink : Color.gray.opacity(0.3))
                                .frame(width: currentPage == index ? 12 : 8, height: currentPage == index ? 12 : 8)
                                .animation(.spring(), value: currentPage)
                        }
                    }
                }
            }
            .background(
                LinearGradient(gradient: Gradient(colors: [.borderPink, .white]), startPoint: .top, endPoint: .bottom)
            )
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
    
    @ViewBuilder
    private func getPageView(for page: OnboardingPage) -> some View {
        ZStack {
            VStack (alignment: .center) {
                Image(page.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.45
                        } else {
                            return length
                        }
                    }
                    .accessibilityHidden(true)
                
                VStack (alignment: .center, spacing: 8) {
                    Text(page.title)
                        .font(.title)
                        .bold()
                        .foregroundColor(.primaryPink)
                    Text(page.description)
                        .font(.body)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.35
                    } else {
                        return length * 0.85
                    }
                }
                
                if page.title != "Compartilhe sua criação" {
                    HStack (spacing: 120) {
                        NavigationLink(destination: HomeView()) {
                            Text("Pular")
                                .padding(.top,10)
                                .padding(.bottom,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .foregroundColor(.primaryPink)
                                .bold()
                        }
                        .background(.borderPink)
                        .opacity(0.8)
                        .cornerRadius(100)
                        .simultaneousGesture(TapGesture().onEnded {
                            isFirstLaunch = false
                        })
                        
                        Button(action: {
                            self.currentPage = self.currentPage + 1
                        }) {
                            Text("Próximo")
                                .padding(.top,10)
                                .padding(.bottom,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .foregroundColor(.white)
                                .bold()
                        }
                        .background(.primaryPink)
                        .cornerRadius(100)
                    }
                } else {
                    HStack (spacing: 120) {
                        NavigationLink(destination: HomeView()) {
                            Text("Começar agora!")
                                .padding(.top,10)
                                .padding(.bottom,10)
                                .padding(.leading,20)
                                .padding(.trailing,20)
                                .foregroundColor(.white)
                                .bold()
                        }
                        .background(.primaryPink)
                        .cornerRadius(100)
                        .simultaneousGesture(TapGesture().onEnded {
                            isFirstLaunch = false
                        })
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
    }
}

//#Preview {
//    OnboardingView()
//}
