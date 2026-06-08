//
//  CreatePostView.swift
//  DressUpGame
//
//  Created by USER on 27/04/26.
//

import SwiftUI


@Observable
class ModelTest: Identifiable {
    let id = UUID()
    var imageName: Image
    var position: CGPoint
    
    init(imageName: Image, position: CGPoint) {
        self.imageName = imageName
        self.position = position
    }
    
    static func == (lhs: ModelTest, rhs: ModelTest) -> Bool {
        lhs.id == rhs.id
    }
}

struct CreatePostView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.displayScale) var displayScale
    @State var selectedOption: PostOptions = .stickers
    @State private var showActivityControllerView: Bool = false
    @State var selectedItens: [ModelTest] = []
    @Binding var doll: DollClass
    
    var wallpaper: Image = Image("Background0")
    
    @State var changes = 0
    
    @State var background = WallpaperClass(wallpaper: 0)
    
    let sizeScreenHeight: CGFloat = UIScreen.main.bounds.height
    let sizeScreenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .center) {
                VStack (spacing: sizeScreenHeight * 0.04) {
                    VStack (spacing: 0) {
                        Group {
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.borderPink)
                            
                            postGroup
                                .clipShape(.rect(cornerRadius: 6))
                            
                            Rectangle()
                                .frame(height: 1)
                                .foregroundColor(Color.borderPink)
                        }
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.7
                        } else {
                            return length
                        }
                    }
                    
                    VStack (spacing: 0) {
                        HStack (spacing: 0) {
                            stickerButton
                            paletteButton
                            bubbleButton
                            textButton
                        }
                        
                        DecorationItens(selectedOption: $selectedOption) { tapped in
                            if (selectedOption == .palettes) {
                                background.setWallpaper(wallpaper: tapped)
                            }
                            
                            if (selectedOption == .stickers) {
                                let newItem = ModelTest(imageName: Image("Sticker\(tapped)"), position: .init(x: 200, y: 200))
                                selectedItens.append(newItem)
                            }
                            
                            if (selectedOption == .bubbles) {
                                let newItem = ModelTest(imageName: Image("Bubble\(tapped)"), position: .init(x: 200, y: 200))
                                selectedItens.append(newItem)
                            }
                            
                            if (selectedOption == .texts) {
                                let newItem = ModelTest(imageName: Image("Alphabet\(tapped)"), position: .init(x: 200, y: 200))
                                selectedItens.append(newItem)
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
                    } else {
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
                    }
                    if #available(iOS 26.0, *) {
                        ToolbarItem(placement: .automatic) {
                            Menu{
                                ShareLink(
                                    item: renderedDoll,
                                    preview: SharePreview(
                                        Text("Doll"),
                                        image: renderedDoll
                                    )
                                ) {
                                    Label("Compartilhar Doll", systemImage: "person.fill")
                                }
                                .id(changes)
                                ShareLink(
                                    item: renderedImage,
                                    preview: SharePreview(
                                        Text("Post"),
                                        image: renderedImage
                                    )
                                )
                                {
                                    Label("Compartilhar Post", systemImage: "person.crop.square.on.square.angled")
                                        .foregroundStyle(Color(.systemGray))
                                }
                                .id(changes)
                                
                            }
                            label:{
                                Image("share_button")
                            }
                            .navigationBarBackButtonHidden(true)
                        }
                        .sharedBackgroundVisibility(.hidden)
                    } else {
                        ToolbarItem(placement: .automatic) {
                            Menu{
                                ShareLink(
                                    item: renderedDoll,
                                    preview: SharePreview(
                                        Text("Doll"),
                                        image: renderedDoll
                                    )
                                ) {
                                    Label("Compartilhar Doll", systemImage: "person.fill")
                                }
                                .id(changes)
                                ShareLink(
                                    item: renderedImage,
                                    preview: SharePreview(
                                        Text("Post"),
                                        image: renderedImage
                                    )
                                ) {
                                    Label("Compartilhar Post", systemImage: "person.crop.square.on.square.angled")
                                }
                                .id(changes)
                                
                            }
                            label:{
                                Image("share_button")
                            }
                        }
                        
                        
                        if #available(iOS 26.0, *) {
                            ToolbarItem(placement: .topBarTrailing) {
                                HStack {
                                    ShareLink(
                                        item: renderedImage,
                                        preview: SharePreview(
                                            Text("Post"),
                                            image: renderedImage
                                        )
                                    ) {
                                        Image("share_button")
                                    }
                                    .id(changes)
                                }
                            }
                            .sharedBackgroundVisibility(.hidden)
                        } else {
                            ToolbarItem(placement: .topBarTrailing) {
                                HStack {
                                    ShareLink(
                                        item: renderedImage,
                                        preview: SharePreview(
                                            Text("Post"),
                                            image: renderedImage
                                        )
                                    ) {
                                        Image("share_button")
                                    }
                                    .id(changes)
                                }
                            }
                        }
                    }
                    
                }
                .ignoresSafeArea()
                .background(.lightgreenGradient)
            }
        }
    }
    
    var renderedDoll: Image {
        let renderer = ImageRenderer(content: onlyDoll)
        renderer.scale = displayScale
        
        if let uiImage = renderer.uiImage {
            return Image(uiImage: uiImage)
                .resizable()
        }
        
        return Image("Doll1")
    }
    
    var renderedImage: Image {
        let renderer = ImageRenderer(content: postGroup)
        renderer.scale = displayScale
        
        if let uiImage = renderer.uiImage {
            return Image(uiImage: uiImage)
                .resizable()
        }
        
        return Image("Doll1")
    }
    
    var stickerButton: some View {
        ZStack {
            if (selectedOption == .stickers) {
                Button {
                    
                } label: {
                    ZStack {
                        Image("buttonSelectedPost")
                            .resizable()
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length * 0.25
                                }
                            }
                        Image("stickerButton")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.25
                        }
                    }
                    .border(Color.borderPink, width: 1)
                }
            } else {
                Button {
                    selectedOption = .stickers
                } label: {
                    ZStack {
                        Image("stickerButton")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.25
                        }
                    }
                    .background(.white)
                    .border(Color.borderPink, width: 1)
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.1
                    } else {
                        return length * 0.25
                    }
                }
            }
        }
    }
    
    var paletteButton: some View {
        ZStack {
            if (selectedOption == .palettes) {
                Button {
                    
                } label: {
                    ZStack {
                        Image("buttonSelectedPost")
                            .resizable()
                        
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length * 0.25
                                }
                            }
                        Image("paletteButton")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.25
                        }
                    }
                    .border(Color.borderPink, width: 1)
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.1
                    } else {
                        return length * 0.25
                    }
                }
                
                
            } else {
                Button {
                    selectedOption = .palettes
                } label: {
                    ZStack {
                        Image("paletteButton")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.25
                        }
                    }
                    .background(.white)
                    .border(Color.borderPink, width: 1)
                }
                
            }
        }
    }
    
    var bubbleButton: some View {
        ZStack {
            if (selectedOption == .bubbles) {
                Button {
                    
                } label: {
                    ZStack {
                        Image("buttonSelectedPost")
                            .resizable()
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length * 0.25
                                }
                            }
                        Image("bubbleButton")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.25
                        }
                    }
                    .border(Color.borderPink, width: 1)
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.1
                    } else {
                        return length * 0.25
                    }
                }
            } else {
                Button {
                    selectedOption = .bubbles
                } label: {
                    ZStack {
                        Image("bubbleButton")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.25
                        }
                    }
                    .background(.white)
                    .border(Color.borderPink, width: 1)
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.1
                    } else {
                        return length * 0.25
                    }
                }
            }
        }
    }
    
    var textButton: some View {
        ZStack {
            if (selectedOption == .texts) {
                Button {
                    
                } label: {
                    ZStack {
                        Image("buttonSelectedPost")
                            .resizable()
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.1
                                } else {
                                    return length * 0.25
                                }
                            }
                        Image("textButton")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.25
                        }
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.25
                        }
                    }
                    .border(Color.borderPink, width: 1)
                }
            } else {
                Button {
                    selectedOption = .texts
                } label: {
                    ZStack {
                        Image("textButton")
                    }
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 0.1
                        } else {
                            return length * 0.25
                        }
                    }
                    .background(.white)
                    .border(Color.borderPink, width: 1)
                }
            }
        }
    }
    
    var onlyDoll: some View {
        ZStack{
            DollView(doll: doll)
        }
        .frame(width: 200, height: 400)
    }
    
    var postGroup: some View {
        ZStack {
            DollView(doll: doll)
        }
        .frame(width: 400, height: 400)
        .background(Image("Background\(background.wallpaper)"))
        //        .ignoresSafeArea()
        .overlay {
            
            ForEach(selectedItens) { item in
                
                item.imageName
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70, height: 70)
                    .position(item.position)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                item.position = gesture.location
                            }
                            .onEnded { _ in
                                changes += 1
                            }
                    )
            }
        }
        .overlay{
            VStack {
                Image("Dolliu_marca")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .bottomTrailing)
                    .padding(.leading, 400 * 0.7)
                    .padding(.top, 400 * 0.7)
                    .blendMode(.darken)
                //                    .opacity(0.8)
            }
        }
    }
}


//#Preview {
//    CreatePostView()
//}
