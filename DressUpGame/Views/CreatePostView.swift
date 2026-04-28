//
//  CreatePostView.swift
//  DressUpGame
//
//  Created by USER on 27/04/26.
//

import SwiftUI

struct CreatePostView: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            VStack (alignment: .center, spacing: 0) {
                
                Image("Doll")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 450)
                    .position(x: 200, y: 330)
                
                Button {
                    // Button actions here.
                } label: {
                    Image("zoom_button")
                }
                .shadow(radius: 2, y: 2)
                    .position(x: 350, y: 248)
                
                Spacer()
                
                
                Rectangle()
                    .frame(height: 0.5, alignment: .top)
                    .foregroundColor(Color.borderPink)
                
                    HStack (spacing: 0) {
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                Image("buttonSelectedPost")
                                Image("stickerButton")
                            }
                        }
                        .frame(width: 101, height: 60)
                        .border(Color.borderPink, width: 1)
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("buttonSelected")
                                Image("paletteButton")
                            }
                        }
                        .frame(width: 101, height: 60)
                        .border(Color.borderPink, width: 1)
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //                                Image("ButtonSelected")
                                Image("bubbleButton")
                            }
                        }
                        .frame(width: 101, height: 60)
                        .border(Color.borderPink, width: 1)
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //                                Image("ButtonSelected")
                                Image("textButton")
                            }
                        }
                        .frame(width: 101, height: 60)
                        .border(Color.borderPink, width: 1)
                    }
                
                .background(Color.white)
                
                Rectangle()
                    .frame(height: 0.5, alignment: .top)
                    .foregroundColor(Color.borderPink)
                
//                ScrollView (.horizontal, showsIndicators: false) {
//                    HStack (spacing: 0) {
//                        Circle()
//                            .fill(Color.gray)
//                            .frame(width: 30, height: 30)
//                            .padding(10)
//                        Circle()
//                            .fill(Color.beige)
//                            .frame(width: 30, height: 30)
//                            .padding(10)
//                        Circle()
//                            .fill(Color.orange)
//                            .frame(width: 30, height: 30)
//                            .padding(10)
//                        Circle()
//                            .fill(Color.darkRed)
//                            .frame(width: 30, height: 30)
//                            .padding(10)
//                        Circle()
//                            .fill(Color.brown)
//                            .frame(width: 30, height: 30)
//                            .padding(10)
//                        Circle()
//                            .fill(Color.blue)
//                            .frame(width: 30, height: 30)
//                            .padding(10)
//                        Circle()
//                            .fill(Color.pink)
//                            .frame(width: 30, height: 30)
//                            .padding(10)
//                        Circle()
//                            .fill(Color.purple)
//                            .frame(width: 30, height: 30)
//                            .padding(10)
//                    }
//                }
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
                                Label("New Look",systemImage: "camera.viewfinder")
                                    .labelStyle(.iconOnly)
                                    .foregroundStyle(Color(.primaryPink))
                                    .font(.system(size: 50))
                            }
                        }
                        .frame(width: 100, height: 105)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("assetSelected")
                            }
                        }
                        .frame(width: 100, height: 105)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                            }
                        }
                        .frame(width: 100, height: 105)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                            }
                        }
                        .frame(width: 100, height: 105)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                            }
                        }
                        .frame(width: 130, height: 105)
                    }
                }
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 0) {
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                            }
                        }
                        .frame(width: 100, height: 105)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("assetSelected")
                            }
                        }
                        .frame(width: 100, height: 105)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                            }
                        }
                        .frame(width: 100, height: 105)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                            }
                        }
                        .frame(width: 100, height: 105)
                        
                        Button {
                            // Button actions here.
                        } label: {
                            ZStack {
                                //Image("AssetSelected")
                            }
                        }
                        .frame(width: 130, height: 105)
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
                    NavigationLink(destination: CreateAvatarView()) {
                        Button {
                            self.presentationMode.wrappedValue.dismiss()
                        } label: {
                            Image("chevron_left_button")
                        }
                        .shadow(radius: 2, y: 2)
                    }
                }
                .sharedBackgroundVisibility(.hidden)
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        // Button actions here.
                    } label: {
                        Image("shareButton")
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
    CreatePostView()
}
