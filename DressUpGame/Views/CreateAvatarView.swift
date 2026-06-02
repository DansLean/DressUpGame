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
    
    @State var doll = DollClass(face: Asset(image: UIImage(resource: .doll1)), hair: Asset(image: UIImage()), top: Asset(image: UIImage()), bottom: Asset(image: UIImage()), shoes: Asset(image: UIImage()), accessories: Asset(image: UIImage()))
    
    var body: some View {
        NavigationStack {
            ZStack {
                //                ZStack(alignment: .topLeading) {
                //
                //                    HStack {
                //                        Button {
                //                            self.presentationMode.wrappedValue.dismiss()
                //                        } label: {
                //
                //                            Image("chevron_left_button")
                //
                //                        }
                //                        .shadow(radius: 2, y: 2)
                //
                //                        Spacer()
                //
                //                        Button {
                //
                //                        } label: {
                //                            NavigationLink(destination: CreatePostView(doll: $doll)) {
                //                                Image("chevron_right_button")
                //                            }
                //                        }
                //                        .shadow(radius: 2, y: 2)
                //
                //                    }
                //                }
                
                Image("Background0")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack (spacing: 0) {
                    VStack(alignment: .center) {
                        DollView(doll: doll)
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.85
                                } else {
                                    return length
                                }
                            }
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.7
                        } else {
                            return length
                        }
                    }
                    
                    Group {
                        Rectangle()
                            .frame(height: 0.5, alignment: .top)
                            .foregroundColor(Color.borderPink)
                        
                        //                    ScrollView (.horizontal, showsIndicators: false) {
                        HStack (spacing: 0) {
                            faceButton
                            hairButton
                            topButton
                            bottomButton
                            shoesButton
                            //                            accessoriesButton
                        }
                        //                    }
                        .background(Color.white)
                        
                        Rectangle()
                            .frame(height: 0.5, alignment: .top)
                            .foregroundColor(Color.borderPink)
                        
                        AvatarDecorationItens(selectedCustomization: $selectedCustomization) { tapped in
                            if selectedCustomization == .face {
                                doll.setDoll(face: Asset(image: tapped))
                            }
                            if selectedCustomization == .hair {
                                doll.setHair(hair: Asset(image: tapped))
                            }
                            if selectedCustomization == .top {
                                doll.setTop(top: Asset(image: tapped))
                            }
                            if selectedCustomization == .bottom {
                                doll.setBottom(bottom: Asset(image: tapped))
                            }
                            if selectedCustomization == .shoes {
                                doll.setShoes(shoes: Asset(image: tapped))
                            }
                            if selectedCustomization == .accessories {
                                doll.setAccessories(accessories: Asset(image: tapped))
                            }
                        }
                        .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                            if axis == .vertical {
                                return length * 0.3
                            } else {
                                return length
                            }
                        }
                    }
                    
                    
                }
                .toolbar {
                    if #available(iOS 26.0, *) {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                
                                Image("chevron_left_button")
                                
                            }
                            .shadow(radius: 2, y: 2)
                        }
                        .sharedBackgroundVisibility(.hidden)
                    } else {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                
                                Image("chevron_left_button")
                                
                            }
                            .shadow(radius: 2, y: 2)
                        }
                    }
                    
                    
                    if #available(iOS 26.0, *) {
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
                    } else {
                        ToolbarItem(placement: .topBarTrailing) {
                            
                            Button {
                                
                            } label: {
                                NavigationLink(destination: CreatePostView(doll: $doll)) {
                                    Image("chevron_right_button")
                                }
                            }
                            .shadow(radius: 2, y: 2)
                            
                        }
                    }
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
                        Image("buttonSelectedPost")
                            .resizable()
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length * 0.2
                                }
                            }
                        Image("AvatarHead")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
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
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
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
                        Image("buttonSelectedPost")
                            .resizable()
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length * 0.2
                                }
                            }
                        Image("AvatarHair")
                    }
                    .background()
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
                    .border(Color.borderPink, width: 1)
                }
                
            } else {
                Button {
                    selectedCustomization = .hair
                } label: {
                    ZStack {
                        Image("AvatarHair")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
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
                        Image("buttonSelectedPost")
                            .resizable()
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length * 0.2
                                }
                            }
                        Image("AvatarTop")
                    }
                    .background()
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
                    .border(Color.borderPink, width: 1)
                }
                
            } else {
                Button {
                    selectedCustomization = .top
                } label: {
                    ZStack {
                        Image("AvatarTop")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
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
                        Image("buttonSelectedPost")
                            .resizable()
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length * 0.2
                                }
                            }
                        Image("AvatarBottom")
                    }
                    .background()
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
                    .border(Color.borderPink, width: 1)
                }
                
            } else {
                Button {
                    selectedCustomization = .bottom
                } label: {
                    ZStack {
                        Image("AvatarBottom")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
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
                        Image("buttonSelectedPost")
                            .resizable()
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length * 0.2
                                }
                            }
                        Image("AvatarShoes")
                    }
                    .background()
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
                    .border(Color.borderPink, width: 1)
                }
                
            } else {
                Button {
                    selectedCustomization = .shoes
                } label: {
                    ZStack {
                        Image("AvatarShoes")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
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
                        Image("buttonSelectedPost")
                            .resizable()
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length * 0.2
                                }
                            }
                        Image("AvatarAccessories")
                    }
                    .background()
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
                    .border(Color.borderPink, width: 1)
                }
                
            } else {
                Button {
                    selectedCustomization = .accessories
                } label: {
                    ZStack {
                        Image("AvatarAccessories")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.2
                        }
                    }
                    .border(Color.borderPink, width: 1)
                }
            }
        }
        
        
    }
    
    
}

#Preview {
    CreateAvatarView()
}
