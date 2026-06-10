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
    var imageSize: CGFloat = 70
    var position: CGPoint
    var borderStickerWidth: CGFloat = 0
    
    init(imageName: Image, position: CGPoint) {
        self.imageName = imageName
        self.position = position
    }
    
    func setBorder(borderStickerWidth: CGFloat) {
        self.borderStickerWidth = borderStickerWidth
        self.imageName = imageName
    }
    
    func increaseSize(size: CGFloat) {
        self.imageSize = imageSize + size
        self.imageName = imageName
    }
    
    func decreaseSize(size: CGFloat) {
        self.imageSize = imageSize - size
        self.imageName = imageName
    }
    
    static func == (lhs: ModelTest, rhs: ModelTest) -> Bool {
        lhs.id == rhs.id
    }
}

struct CreatePostView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.displayScale) var displayScale
    @Binding var doll: DollClass
    @State var selectedOption: PostOptions = .stickers
    @State private var showActivityControllerView: Bool = false
    @State var selectedItens: [ModelTest] = []
    @State var indexTapped: Int?
    
    var wallpaper: UIImage = UIImage(resource: .background0)
    
    @State var changes = 0
    
    @State var background = WallpaperClass(wallpaper: UIImage(resource: .background0))
    
    let sizeScreenHeight: CGFloat = UIScreen.main.bounds.height
    let sizeScreenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .center) {
                VStack (alignment: .center, spacing: 0) {
                    postGroup
                        .clipShape(.rect(cornerRadius: 6))
                        .border(.borderPink)
                        .containerRelativeFrame(.vertical, alignment: .center) { length, axis in
                            return length * 0.615
                        }
                    
                    Spacer(minLength: 40)
                    
                    VStack (spacing: 0) {
                        Rectangle()
                            .frame(height: 0.5)
                            .foregroundColor(Color.borderPink)
                        
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
                                let newItem = ModelTest(imageName: Image(uiImage: tapped), position: .init(x: 200, y: 200))
                                selectedItens.append(newItem)
                            }
                            
                            if (selectedOption == .bubbles) {
                                let newItem = ModelTest(imageName: Image(uiImage: tapped), position: .init(x: 200, y: 200))
                                selectedItens.append(newItem)
                            }
                            
                            if (selectedOption == .texts) {
                                let newItem = ModelTest(imageName: Image(uiImage: tapped), position: .init(x: 200, y: 200))
                                selectedItens.append(newItem)
                            }
                        }
                        .containerRelativeFrame(.vertical) { length, axis in
                            return length * 0.325
                        }
                    }
                }
                .background(.white)
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
                            Menu {
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
                                    .onTapGesture {
                                        indexTapped = nil
                                        updateList(stickerID: UUID())
                                    }
                            }
                            .shadow(radius: 2, y: 2)
                            .navigationBarBackButtonHidden(true)
                            
                        }
                        .sharedBackgroundVisibility(.hidden)
                        
                        
                    } else {
                        ToolbarItem(placement: .automatic) {
                            Menu {
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
                            label: {
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
    
    var postWidth: CGFloat {
        let postWidth = sizeScreenWidth
        
        if (postWidth < 400) {
            return 400
        }
        
        return postWidth
    }
    
    var postHeight: CGFloat {
        let postHeight = sizeScreenHeight * 0.5
        
        if (postHeight < 400) {
            return 400
        }
        
        return postWidth
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
    
    func updateList(stickerID: UUID) {
        for sticker in selectedItens {
            if (sticker.id == stickerID) {
                sticker.setBorder(borderStickerWidth: 1.5)
            } else {
                sticker.setBorder(borderStickerWidth: 0)
            }
        }
    }
    
    var postGroup: some View {
        ZStack {
            DollView(doll: doll)
        }
        .frame(width: postWidth, height: postHeight)
        .background(
            Image(uiImage: background.wallpaper)
                .resizable()
                .scaledToFill()
        )
        .onTapGesture { apGesture in
            indexTapped = nil
            updateList(stickerID: UUID())
        }
        .overlay {
            ForEach(selectedItens.enumerated(), id: \.offset) { index, item in
                item.imageName
                    .resizable()
                    .scaledToFit()
                    .frame(width: item.imageSize, height: item.imageSize)
                    .padding(8)
                    .border(.primaryPink, width: item.borderStickerWidth)
                
                    .position(item.position)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                indexTapped = index
                                updateList(stickerID: item.id)
                                item.position = gesture.location
                            }
                            .onEnded { _ in
                                changes += 1
                            }
                    )
                    .onTapGesture { apGesture in
                        indexTapped = index
                        updateList(stickerID: item.id)
                    }
                    .overlay {
                        if (index == indexTapped) {
                            Button {
                                selectedItens.remove(at: index)
                                indexTapped = nil
                                item.setBorder(borderStickerWidth: 0)
                            }
                            label: {
                                Image(systemName: "trash")
                                    .bold()
                                    .foregroundStyle(.white)
                                    .frame(width: 35, height: 35)
                                    .background(.primaryPink)
                                    .clipShape(Circle())
                            }
                            .padding(.leading, sizeScreenWidth * 0.82)
                            .padding(.top, postHeight * 0.55)
                            
                            Button {
                                item.decreaseSize(size: 10)
                            }
                            label: {
                                Image(systemName: "minus")
                                    .bold()
                                    .foregroundStyle(.white)
                                    .frame(width: 35, height: 35)
                                    .background(.primaryPink)
                                    .clipShape(Circle())
                            }
                            .padding(.leading, sizeScreenWidth * 0.82)
                            .padding(.top, postHeight * 0.35)
                            
                            Button {
                                item.increaseSize(size: 10)
                            }
                            label: {
                                Image(systemName: "plus")
                                    .bold()
                                    .foregroundStyle(.white)
                                    .frame(width: 35, height: 35)
                                    .background(.primaryPink)
                                    .clipShape(Circle())
                            }
                            .padding(.leading, sizeScreenWidth * 0.82)
                            .padding(.top, postHeight * 0.15)
                        }
                    }
            }
        }
        .overlay {
            VStack {
                Image("Dolliu_marca")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80, height: 80, alignment: .bottomTrailing)
                    .padding(.leading, sizeScreenWidth * 0.7)
                    .padding(.top, postHeight * 0.65)
                    .blendMode(.darken)
            }
        }
    }
}


//#Preview {
//    CreatePostView()
//}
