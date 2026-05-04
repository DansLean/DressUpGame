//
//  CreateAvatarView.swift
//  DressUpGame
//
//  Created by User on 24/04/26.
//

import SwiftUI

struct CreateAvatarView: View {
    @Environment(\.presentationMode) var presentationMode
    @State var selectedCustomization: AvatarOptions = .face
    @State var selectedItens: [ModelTest] = []
    var face: Image = Image("Doll1")
    var hair: Image = Image("Hair1")
    var top: Image = Image("Top1")
    var bottom: Image = Image("Bottom1")
    var shoes: Image = Image("Shoes1")
    var accessories: Image = Image("Accessories1")
    
    @State var doll = DollClass(face: 1, hair: 0, top: 0, bottom: 0, shoes: 0, accessories: 0)
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("backgroundFill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack (spacing: 0) {
                    
                    DollView(doll: doll)
                    
                    Rectangle()
                        .frame(height: 0.5, alignment: .top)
                        .foregroundColor(Color.borderPink)
                    
                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack (spacing: 0) {
                            faceButton
                            hairButton
                            topButton
                            bottomButton
                            shoesButton
                            accessoriesButton
                        }
                    }
                    .background(Color.white)
                    
                    Rectangle()
                        .frame(height: 0.5, alignment: .top)
                        .foregroundColor(Color.borderPink)
                    
//                    ScrollView (.horizontal, showsIndicators: false) {
//                        HStack (spacing: 0) {
//                            Circle()
//                                .fill(Color.grayColorNew)
//                                .frame(width: 30, height: 30)
//                                .padding(10)
//                            Circle()
//                                .fill(Color.beigeColorNew)
//                                .frame(width: 30, height: 30)
//                                .padding(10)
//                            Circle()
//                                .fill(Color.orangeColorNew)
//                                .frame(width: 30, height: 30)
//                                .padding(10)
//                            Circle()
//                                .fill(Color.redColorNew)
//                                .frame(width: 30, height: 30)
//                                .padding(10)
//                            Circle()
//                                .fill(Color.brownColorNew)
//                                .frame(width: 30, height: 30)
//                                .padding(10)
//                            Circle()
//                                .fill(Color.blueColorNew)
//                                .frame(width: 30, height: 30)
//                                .padding(10)
//                            Circle()
//                                .fill(Color.pinkColorNew)
//                                .frame(width: 30, height: 30)
//                                .padding(10)
//                            Circle()
//                                .fill(Color.purpleColorNew)
//                                .frame(width: 30, height: 30)
//                                .padding(10)
//                        }
//                    }
//                    .background(Color.white)
//                    Rectangle()
//                        .frame(height: 1, alignment: .top)
//                        .foregroundColor(Color.borderPink)
                    
                    AvatarDecorationItens(selectedCustomization: $selectedCustomization) { tapped in
                        if selectedCustomization == .face {
                            doll.setDoll(face: tapped)
                        }
                        if selectedCustomization == .hair {
                            doll.setHair(hair: tapped)
                        }
                        if selectedCustomization == .top {
                            doll.setTop(top: tapped)
                        }
                        if selectedCustomization == .bottom {
                            doll.setBottom(bottom: tapped)
                        }
                        if selectedCustomization == .shoes {
                            doll.setShoes(shoes: tapped)
                        }
                        if selectedCustomization == .accessories {
                            doll.setAccessories(accessories: tapped)
                        }
//                            let newItem = ModelTest(imageName: tapped, position: .init(x: 200, y: 200))
//                            selectedItens.append(newItem)
                        
                        
                    }

                }
                //            .background(
                //                Image("backgroundFill")
                //                    .resizable()
                //                    .aspectRatio(contentMode: .fill)
                //            )
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
                            NavigationLink(destination: CreatePostView(doll: $doll)) {
                                Image("chevron_right_button")
                            }
                        }
                        .shadow(radius: 2, y: 2)
                        
                    }
                    .sharedBackgroundVisibility(.hidden)
                }
                //.ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            }
        }
    }
    var faceButton: some View {
        ZStack {
            if (selectedCustomization == .face) {
                Button {
                    
                } label: {
                    ZStack {
                        Image("buttonSelected")
                        Image("AvatarHead")
                    }
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
                
            }
            else {
                Button {
                    selectedCustomization = .face
                } label: {
                    ZStack {
                        Image("AvatarHead")
                    }
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
            }
        }
    }
    
    var hairButton: some View {
        ZStack {
            if (selectedCustomization == .hair) {
                Button {
                    
                } label: {
                    ZStack {
                        Image("buttonSelected")
                        Image("AvatarHair")
                    }
                    .background()
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
                
            } else {
                Button {
                    selectedCustomization = .hair
                } label: {
                    ZStack {
                        Image("AvatarHair")
                    }
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
            }
        }
        
        
    }
    
    var topButton: some View {
        ZStack {
            if (selectedCustomization == .top) {
                Button {
                    
                } label: {
                    ZStack {
                        Image("buttonSelected")
                        Image("AvatarTop")
                    }
                    .background()
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
                
            } else {
                Button {
                    selectedCustomization = .top
                } label: {
                    ZStack {
                        Image("AvatarTop")
                    }
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
            }
        }
        
        
    }
    
    var bottomButton: some View {
        ZStack {
            if (selectedCustomization == .bottom) {
                Button {
                    
                } label: {
                    ZStack {
                        Image("buttonSelected")
                        Image("AvatarBottom")
                    }
                    .background()
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
                
            } else {
                Button {
                    selectedCustomization = .bottom
                } label: {
                    ZStack {
                        Image("AvatarBottom")
                    }
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
            }
        }
        
        
    }
    
    var shoesButton: some View {
        ZStack {
            if (selectedCustomization == .shoes) {
                Button {
                    
                } label: {
                    ZStack {
                        Image("buttonSelected")
                        Image("AvatarShoes")
                    }
                    .background()
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
                
            } else {
                Button {
                    selectedCustomization = .shoes
                } label: {
                    ZStack {
                        Image("AvatarShoes")
                    }
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
            }
        }
        
        
    }
    
    var accessoriesButton: some View {
        ZStack {
            if (selectedCustomization == .accessories) {
                Button {
                    
                } label: {
                    ZStack {
                        Image("buttonSelected")
                        Image("AvatarAccessories")
                    }
                    .background()
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
                
            } else {
                Button {
                    selectedCustomization = .accessories
                } label: {
                    ZStack {
                        Image("AvatarAccessories")
                    }
                    .frame(width: 70, height: 60)
                    .border(Color.borderPink, width: 1)
                }
            }
        }
        
        
    }


}

#Preview {
    CreateAvatarView()
}
