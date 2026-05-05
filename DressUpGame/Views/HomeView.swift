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
            VStack(alignment: .center, spacing: 30)  {
                HStack (spacing: 24) {
//                    VStack{
//                        Spacer()
//                        Button {
//                        } label: {
//                            Image("trash_button")
//                                .shadow(radius: 2, y: 2)
//                        }
//                    }
                    
                    VStack {
                        Spacer()
                        Spacer()
                        Spacer()
                        Image("Doll1")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200, height: 450)
                        Spacer()
                        
                    }
//                    VStack (spacing: 18) {
//                        Spacer()
//                        Button {
//                        } label: {
//                            Image("post_button")
//                                .shadow(radius: 2, y: 2)
//                        }
//                        .buttonBorderShape(.circle)
//                        Button {
//                        } label: {
//                            Image("hanger_button")
//                                .shadow(radius: 2, y: 2)
//                            
//                        }
//                        
//                    }
                }

                
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
                                Text("New Look")
                                    .foregroundStyle(.primaryPink)
                                    .font(.system(size: 18, weight: .semibold))
                            }
                        }
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 270)
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
