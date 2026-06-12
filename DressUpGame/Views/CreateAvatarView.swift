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
    @State var selectedHairColor: Color = .grayColorNew
    @State var selectedTopColor: Color = .grayColorNew
    @State var selectedBottomColor: Color = .grayColorNew
    @State var selectedItens: [ModelTest] = []
    var face: Image = Image("Doll1")
    var hair: Image = Image("Hair1")
    var top: Image = Image("Top1")
    var bottom: Image = Image("Bottom1")
    var shoes: Image = Image("Shoes1")
    var accessories: Image = Image("Accessories1")
    
    @State var doll = DollClass(face: Asset(image: UIImage(resource: .doll1), description: "Boneca com traços femininos de tom claro"), hair: Asset(image: UIImage(), description: ""), hairColor: .grayColorNew, top: Asset(image: UIImage(), description: ""), topColor: .grayColorNew, bottom: Asset(image: UIImage(), description: ""), bottomColor: .grayColorNew, shoes: Asset(image: UIImage(), description: ""), accessories: Asset(image: UIImage(), description: ""))
    
    var body: some View {
        NavigationStack {
            ZStack {
                Image("Background0")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .accessibilityHidden(true)
                
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
                        .accessibilityElement(children: .contain)
                        
                        Rectangle()
                            .frame(height: 0.5, alignment: .top)
                            .foregroundColor(Color.borderPink)
                        
                        if selectedCustomization == .hair {
                            ColorHairsItens() { tapped in
                                doll.setHairColor(hairColor: tapped)
                                selectedHairColor = tapped
                            }
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length
                                }
                            }
                            
                            Rectangle()
                                .frame(height: 1.6, alignment: .top)
                                .foregroundColor(Color.borderPink)
                        }
                        
                        if selectedCustomization == .top {
                            ColorClothesItens() { tapped in
                                doll.setTopColor(topColor: tapped)
                                selectedTopColor = tapped
                            }
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length
                                }
                            }
                            
                            Rectangle()
                                .frame(height: 1.6, alignment: .top)
                                .foregroundColor(Color.borderPink)
                        }
                        
                        if selectedCustomization == .bottom {
                            ColorClothesItens() { tapped in
                                doll.setBottomColor(bottomColor: tapped)
                                selectedBottomColor = tapped
                            }
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length
                                }
                            }
                            
                            Rectangle()
                                .frame(height: 1.6, alignment: .top)
                                .foregroundColor(Color.borderPink)
                        }
                        
                        
                        if selectedCustomization == .hair || selectedCustomization == .top || selectedCustomization == .bottom {
                            AvatarDecorationItens(selectedCustomization: $selectedCustomization, assetHairColor: $selectedHairColor, assetTopColor: $selectedTopColor, assetBottomColor: $selectedBottomColor) { tapped in
                                if selectedCustomization == .face {
                                    doll.setDoll(face: Asset(image: tapped.image, description: tapped.description))
                                }
                                
                                if selectedCustomization == .hair {
                                    doll.setHair(hair: Asset(image: tapped.image, description: tapped.description))
                                }
                                
                                if selectedCustomization == .top {
                                    doll.setTop(top: Asset(image: tapped.image, description: tapped.description))
                                }
                                
                                if selectedCustomization == .bottom {
                                    doll.setBottom(bottom: Asset(image: tapped.image, description: tapped.description))
                                }
                                
                                if selectedCustomization == .shoes {
                                    doll.setShoes(shoes: Asset(image: tapped.image, description: tapped.description))
                                }
                                
                                if selectedCustomization == .accessories {
                                    doll.setAccessories(accessories: Asset(image: tapped.image, description: tapped.description))
                                }
                            }
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.2
                                } else {
                                    return length
                                }
                            }
                        } else {
                            AvatarDecorationItens(selectedCustomization: $selectedCustomization, assetHairColor: $selectedHairColor, assetTopColor: $selectedTopColor, assetBottomColor: $selectedBottomColor) { tapped in
                                if selectedCustomization == .face {
                                    doll.setDoll(face: Asset(image: tapped.image, description: tapped.description))
                                }
                                
                                if selectedCustomization == .hair {
                                    doll.setHair(hair: Asset(image: tapped.image, description: tapped.description))
                                }
                                
                                if selectedCustomization == .top {
                                    doll.setTop(top: Asset(image: tapped.image, description: tapped.description))
                                }
                                
                                if selectedCustomization == .bottom {
                                    doll.setBottom(bottom: Asset(image: tapped.image, description: tapped.description))
                                }
                                
                                if selectedCustomization == .shoes {
                                    doll.setShoes(shoes: Asset(image: tapped.image, description: tapped.description))
                                }
                                
                                if selectedCustomization == .accessories {
                                    doll.setAccessories(accessories: Asset(image: tapped.image, description: tapped.description))
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
                }
                .toolbar {
                    if #available(iOS 26.0, *) {
                        ToolbarItem(placement: .topBarLeading) {
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image("chevron_left_button")
                                    .accessibilityLabel("Voltar")
                                    .accessibilityHint("Toque duas vezes para voltar à tela inicial.")
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
                                    .accessibilityLabel("Voltar")
                                    .accessibilityHint("Toque duas vezes para voltar à tela inicial.")
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
                                        .accessibilityLabel("Avançar")
                                        .accessibilityHint("Toque duas vezes para avançar para a criação de post.")
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
                                        .accessibilityLabel("Avançar")
                                        .accessibilityHint("Toque duas vezes para avançar para a criação de post.")
                                }
                            }
                            .shadow(radius: 2, y: 2)
                        }
                    }
                }
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
                            .accessibilityHidden(true)
                        Image("AvatarHead")
                            .accessibilityLabel("Côrpo")
                            .accessibilityValue(
                                selectedCustomization == .face
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Deslize para baixo para selecionar boneca e tom de pele.")
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
                            .accessibilityLabel("Côrpo")
                            .accessibilityValue(
                                selectedCustomization == .face
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Toque duas vezes para selecionar boneca e tom de pele.")
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
        .accessibilityElement(children: .combine)
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
                            .accessibilityHidden(true)
                        Image("AvatarHair")
                            .accessibilityLabel("Cabelo")
                            .accessibilityValue(
                                selectedCustomization == .hair
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Deslize para baixo para selecionar e colorir cabelo.")
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
                            .accessibilityLabel("Cabelo")
                            .accessibilityValue(
                                selectedCustomization == .hair
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Toque duas vezes para selecionar e colorir cabelo.")
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
                            .accessibilityHidden(true)
                        Image("AvatarTop")
                            .accessibilityLabel("Partes de cima")
                            .accessibilityValue(
                                selectedCustomization == .top
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Deslize para baixo para selecionar e colorir roupas da parte de cima da boneca.")
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
                            .accessibilityLabel("Partes de cima")
                            .accessibilityValue(
                                selectedCustomization == .top
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Toque duas vezes para selecionar e colorir roupas da parte de cima da boneca.")
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
                            .accessibilityHidden(true)
                        Image("AvatarBottom")
                            .accessibilityLabel("Partes de baixo")
                            .accessibilityValue(
                                selectedCustomization == .bottom
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Deslize para baixo para selecionar e colorir roupas da parte de baixo da boneca.")
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
                            .accessibilityLabel("Partes de baixo")
                            .accessibilityValue(
                                selectedCustomization == .bottom
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Toque duas vezes para selecionar e colorir roupas da parte de baixo da boneca.")
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
                            .accessibilityHidden(true)
                        Image("AvatarShoes")
                            .accessibilityLabel("Sapatos")
                            .accessibilityValue(
                                selectedCustomization == .shoes
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Deslize para baixo para selecionar sapatos.")
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
                            .accessibilityLabel("Sapatos")
                            .accessibilityValue(
                                selectedCustomization == .shoes
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Toque duas vezes para selecionar sapatos.")
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
