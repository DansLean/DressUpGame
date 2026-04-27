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
                HStack (spacing: 20) {
                    VStack{
                        Spacer()
                        Button {
                        } label: {
                            Image("trash_button")
                                .shadow(radius: 2, y: 2)
                            
                        }
                    }
                    
                    VStack {
                        Spacer()
                        Image("Doll")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 420)
                        
                    }
                    VStack (spacing: 18) {
                        Spacer()
                        Button {
                        } label: {
                            Image("post_button")
                                .shadow(radius: 2, y: 2)
                        }
                        .buttonBorderShape(.circle)
                        Button {
                        } label: {
                            Image("hanger_button")
                                .shadow(radius: 2, y: 2)
                            
                        }
                        .buttonBorderShape(.circle)
                        
                    }
                    
                }
                Button {
                } label: {
                    ZStack {
                        LinearGradient(gradient: Gradient(colors: [.lightgreenGradient, .greenGradient]), startPoint: .top, endPoint: .bottom)
                        
                        NavigationLink(destination: CreateAvatarView()) {
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
                        .padding()
                        
                    }
                    .frame(maxWidth: .infinity, maxHeight: 300)
                    .overlay(Rectangle()
                        .frame(width: nil, height: 3, alignment: .top)
                        .foregroundColor(.separator), alignment: .top)
                }
            }
            .background(
                Image("backgroundFill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .ignoresSafeArea()
        }
    }
}
#Preview {
    HomeView()
}
