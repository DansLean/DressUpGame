//
//  CreateAvatarView.swift
//  DressUpGame
//
//  Created by User on 24/04/26.
//

import SwiftUI

struct CreateAvatarView: View {
    var body: some View {
        NavigationStack {
            VStack (spacing: 0) {
                Spacer()
                Spacer()
                
                Image("Doll")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 450)
                
                Spacer()
                
                Rectangle()
                    .frame(height: 0.5, alignment: .top)
                    .foregroundColor(Color.borderPink)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0) {
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //                                Image("ButtonSelected")
                                Image("AvatarHead")
                            }
                        }
                        .frame(width: 70, height: 60)
                        .border(Color.borderPink, width: 1)
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                Image("ButtonSelected")
                                Image("AvatarHair")
                            }
                        }
                        .frame(width: 70, height: 60)
                        .border(Color.borderPink, width: 1)
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //                                Image("ButtonSelected")
                                Image("AvatarTop")
                            }
                        }
                        .frame(width: 70, height: 60)
                        .border(Color.borderPink, width: 1)
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //                                Image("ButtonSelected")
                                Image("AvatarBottom")
                            }
                        }
                        .frame(width: 70, height: 60)
                        .border(Color.borderPink, width: 1)
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //                                Image("ButtonSelected")
                                Image("AvatarShoes")
                            }
                        }
                        .frame(width: 70, height: 60)
                        .border(Color.borderPink, width: 1)
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //                                Image("ButtonSelected")
                                Image("AvatarAccessories")
                            }
                        }
                        .frame(width: 70, height: 60)
                        .border(Color.borderPink, width: 0.5)
                    }
                }
                .background(Color.white)
                
                Rectangle()
                    .frame(height: 0.5, alignment: .top)
                    .foregroundColor(Color.borderPink)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0) {
                        Circle()
                            .fill(Color.gray)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.beige)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.orange)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.darkRed)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.brown)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.pink)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.purple)
                            .frame(width: 30, height: 30)
                            .padding(10)
                    }
                }
                .background(Color.white)
                Rectangle()
                    .frame(height: 1, alignment: .top)
                    .foregroundColor(Color.borderPink)
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0) {
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                                Image("Body")
                            }
                        }
                        .frame(width: 130, height: 160)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                Image("AssetSelected")
                                Image("Body")
                            }
                        }
                        .frame(width: 130, height: 160)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                                Image("Body")
                            }
                        }
                        .frame(width: 130, height: 160)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                                Image("Body")
                            }
                        }
                        .frame(width: 130, height: 160)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                                Image("Body")
                            }
                        }
                        .frame(width: 130, height: 160)
                    }
                }
                .background(Color.white)
            }
            .background(
                Image("HomeBackground")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        // Button actions here.
                    } label: {
                        Image(systemName: "chevron.left")
                    }
                }
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // Button actions here.
                    } label: {
                        Image(systemName: "chevron.right")
                    }
                }
            }
            .ignoresSafeArea()
        }
        
    }
}

#Preview {
    CreateAvatarView()
}
