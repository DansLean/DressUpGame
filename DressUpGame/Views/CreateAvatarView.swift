//
//  CreateAvatarView.swift
//  DressUpGame
//
//  Created by User on 24/04/26.
//

import SwiftUI

struct CreateAvatarView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack (spacing: 0) {
                Spacer()
                Spacer()
                
                Image("Doll")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 450)
                    .position(x: 200, y: 330)
                
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
                                Image("buttonSelected")
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
                            .fill(Color.grayColorNew)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.beigeColorNew)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.orangeColorNew)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.redColorNew)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.brownColorNew)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.blueColorNew)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.pinkColorNew)
                            .frame(width: 30, height: 30)
                            .padding(10)
                        Circle()
                            .fill(Color.purpleColorNew)
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
                                Image("body")
                            }
                        }
                        .frame(width: 130, height: 160)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                Image("assetSelected")
                                Image("body")
                            }
                        }
                        .frame(width: 130, height: 160)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                                Image("body")
                            }
                        }
                        .frame(width: 130, height: 160)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                                Image("body")
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
                Image("backgroundFill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            )
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        
                            Image("chevron_left_button")
                        
                    }
                    .shadow(radius: 2, y: 2)
                }
                .sharedBackgroundVisibility(.hidden)
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    
                        Button {
                            
                        } label: {
                            NavigationLink(destination: CreatePostView()) {
                                Image("chevron_right_button")
                            }
                        }
                        .shadow(radius: 2, y: 2)
                    
                }
                .sharedBackgroundVisibility(.hidden)
            }
            .ignoresSafeArea()
            .navigationBarBackButtonHidden(true)
        }
        
    }
}

#Preview {
    CreateAvatarView()
}
