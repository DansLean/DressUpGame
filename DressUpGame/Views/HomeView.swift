//
//  ContentView.swift
//  DressUpGame
//
//  Created by User on 22/04/26.
//

import SwiftUI


struct HomeView: View {
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
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.75
                    } else {
                        return length
                    }
                }
                
//                .overlay{
//                    VStack {
//                        Image("pisoFundo")
//                            .resizable()
//                            .scaledToFit()
//                            .frame(width: 80, height: 80, alignment: .center)
//                            .padding(.leading, 400 * 0.7)
//                            .padding(.top, 400 * 0.7)
//                            .blendMode(.darken)
        //                    .opacity(0.8)
//                    }
//                }
                
                Button {
                    
                } label: {
                    NavigationLink(destination: CreateAvatarView()) {
                        ZStack {
                            LinearGradient(gradient: Gradient(colors: [.lightgreenGradient, .greenGradient]), startPoint: .top, endPoint: .bottom)
                            
                            VStack (spacing: 8) {
                                Label("New Look",systemImage: "plus.circle")
                                    .labelStyle(.iconOnly)
                                    .foregroundStyle(Color(.primaryPink))
                                    .font(.system(size: 58))
                                Text("buttonTitle")
                                    .foregroundStyle(.primaryPink)
                                    .font(.system(.body, weight: .semibold))
                            }
                        }
                    }
                    .overlay(Rectangle()
                        .frame(width: nil, height: 3, alignment: .top)
                        .foregroundColor(.separator), alignment: .top)
                }
                
            }
            .background(
                Image("Background0")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
