//
//  OnboardingView.swift
//  DressUpGame
//
//  Created by Vírna Carvalho on 16/06/26.
//

import Foundation


import SwiftUI


struct OnboardingView: View {
    var body: some View {
        NavigationStack {
            VStack(alignment: .center)  {
                VStack(alignment: .center) {
                    Image("Doll1")
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                            if axis == .vertical {
                                return length * 0.55
                            } else {
                                return length
                            }
                        }
                        .accessibilityHidden(true)
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.75
                    } else {
                        return length
                    }
                }
                
                Button {
                    
                } label: {
                    NavigationLink(destination: CreateAvatarView()) {
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [.lightgreenGradient, .greenGradient]), startPoint: .top, endPoint: .bottom)
                            VStack (spacing: 8) {
                                Label("",systemImage: "plus.circle")
                                    .labelStyle(.iconOnly)
                                    .foregroundStyle(Color(.primaryPink))
                                    .font(.system(size: 58))
                                    .accessibilityHidden(true)
                                Text("New Look")
                                    .foregroundStyle(.primaryPink)
                                    .font(.system(.body, weight: .semibold))
                            }
                        }
                    }
                    .overlay(Rectangle()
                        .frame(width: nil, height: 3, alignment: .top)
                        .foregroundColor(.separator), alignment: .top)
                }
                .accessibilityHint("Toque três vezes para criar um novo look.")
            }
            .background(
                Image("Background0")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .accessibilityHidden(true)
            )
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
