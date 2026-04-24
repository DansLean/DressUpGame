//
//  ContentView.swift
//  DressUpGame
//
//  Created by User on 22/04/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Image("HomeBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
                VStack(alignment: .center, spacing: 30)  {
                    HStack (spacing: 30) {
                        VStack{
                            Spacer()
                            Button {
                            } label: {
                              Image("trash_button")
                            }
                        }
                        
                        VStack {
                            Image("Doll")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 200, height: 400)
                        }
                        VStack {
                            Spacer()
                            Button {
                            } label: {
                              Image("post_button")
                            }
                            .buttonBorderShape(.circle)
                                                        Button {
                              // Button actions here.
                            } label: {
                              Image("hanger_button")
                            }
                            .buttonBorderShape(.circle)
                            
                        }
            
                    }
                    ScrollView(.horizontal) {
                        HStack(spacing: 1) {
                            ForEach(1..<6) {
                                Text("Look \($0)")
                                    .foregroundStyle(.white)
                                    .font(.largeTitle)
                                    .frame(width: 200, height: 200)
                                    .background(.green)
                            }
                        }
                    }
                    .defaultScrollAnchor(.trailing)
                    
                }
                
            }
        
    }
}

#Preview {
    HomeView()
}
