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
    
    @State var changes = 0
    
    @Binding var background: WallpaperClass
    
    let sizeScreenHeight: CGFloat = UIScreen.main.bounds.height
    let sizeScreenWidth: CGFloat = UIScreen.main.bounds.width
    
    var body: some View {
        NavigationStack {
            ZStack (alignment: .center) {
                VStack (alignment: .center, spacing: 0) {
                    postGroup
                        .clipShape(.rect(cornerRadius: 6))
                        .contentShape(.rect(cornerRadius: 6))
                        .border(.borderPink)
                        .containerRelativeFrame(.vertical, alignment: .center) { length, axis in
                            return length * 0.615
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel("\(doll.face.description) \(doll.hair.description != "" ? "com " + doll.hair.description : "" )\(doll.top.description != "" ? ", vestindo " + doll.top.description : "")\(doll.bottom.description != "" ? ", e " + doll.bottom.description : "")\(doll.shoes.description != "" ? ", usando " + doll.shoes.description : ""). Ao fundo, \(background.description).")
                    
                    Spacer(minLength: 40)
                    
                    VStack (spacing: 0) {
                        Rectangle()
                            .frame(height: 0.5)
                            .foregroundColor(Color.borderPink)
                        
                        HStack (spacing: 0) {
                            stickerButton
                                .accessibilityHidden(true)
                            paletteButton
                            bubbleButton
                                .accessibilityHidden(true)
                            textButton
                                .accessibilityHidden(true)
                        }
                        .accessibilityElement(children: .contain)
                        
                        DecorationItens(selectedOption: $selectedOption) { tapped in
                            if (selectedOption == .palettes) {
                                background.setWallpaper(wallpaper: tapped)
                            }
                            
                            if (selectedOption == .stickers) {
                                let newItem = ModelTest(imageName: Image(uiImage: tapped.image), position: .init(x: 200, y: 200))
                                selectedItens.append(newItem)
                                updateList(stickerID: newItem.id)
                                indexTapped = selectedItens.count - 1
                            }
                            
                            if (selectedOption == .bubbles) {
                                let newItem = ModelTest(imageName: Image(uiImage: tapped.image), position: .init(x: 200, y: 200))
                                selectedItens.append(newItem)
                            }
                            
                            if (selectedOption == .texts) {
                                let newItem = ModelTest(imageName: Image(uiImage: tapped.image), position: .init(x: 200, y: 200))
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
                            Button {
                                self.presentationMode.wrappedValue.dismiss()
                            } label: {
                                Image("chevron_left_button")
                                    .accessibilityLabel("Voltar")
                                    .accessibilityHint("Toque duas vezes para voltar à tela de criação de look.")
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
                                    .accessibilityHint("Toque duas vezes para voltar à  tela de criação de look.")
                            }
                            .shadow(radius: 2, y: 2)
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
                                    Label("Share Doll", systemImage: "person.fill")
                                }
                                .id(changes)
                                .accessibilityHint("Toque duas vezes para compartilhar apenas a boneca.")
                                
                                ShareLink(
                                    item: renderedImage,
                                    preview: SharePreview(
                                        Text("Post"),
                                        image: renderedImage
                                    )
                                )
                                {
                                    Label("Share Post", systemImage: "person.crop.square.on.square.angled")
                                        .foregroundStyle(Color(.systemGray))
                                }
                                .id(changes)
                                .accessibilityHint("Toque duas vezes para compartilhar post.")
                            }
                            label: {
                                Image("share_button")
                                    .onTapGesture {
                                        indexTapped = nil
                                        updateList(stickerID: UUID())
                                    }
                            }
                            .accessibilityLabel("Compartilhar")
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
                                    Label("Share Doll", systemImage: "person.fill")
                                }
                                .id(changes)
                                ShareLink(
                                    item: renderedImage,
                                    preview: SharePreview(
                                        Text("Post"),
                                        image: renderedImage
                                    )
                                ) {
                                    Label("Share Post", systemImage: "person.crop.square.on.square.angled")
                                }
                                .id(changes)
                            }
                            label: {
                                Image("share_button")
                                    .accessibilityLabel("Compartilhar")
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
                            .accessibilityHidden(true)
                        Image("stickerButton")
                            .accessibilityLabel("stickers")
                            .accessibilityValue(
                                selectedOption == .stickers
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Deslize para baixo para selecionar sticker.")
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
                            .accessibilityLabel("stickers")
                            .accessibilityValue(
                                selectedOption == .stickers
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Toque duas vezes para selecionar sticker.")
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
                            .accessibilityHidden(true)
                        Image("paletteButton")
                            .accessibilityLabel("Papel de Parede")
                            .accessibilityValue(
                                selectedOption == .palettes
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Deslize para baixo para selecionar papel de parede.")
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
                            .accessibilityLabel("Papel de Parede")
                            .accessibilityValue(
                                selectedOption == .palettes
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Toque duas vezes para selecionar papel de parede.")
                            .accessibilityHint("Toque duas vezes para selecionar papel de parede.")
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
                            .accessibilityHidden(true)
                        Image("bubbleButton")
                            .accessibilityLabel("Balões")
                            .accessibilityValue(
                                selectedOption == .bubbles
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Deslize para baixo para selecionar balões.")
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
                            .accessibilityLabel("Balões")
                            .accessibilityValue(
                                selectedOption == .bubbles
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Toque duas vezes para selecionar balões.")
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
                            .accessibilityHidden(true)
                        Image("textButton")
                            .accessibilityLabel("Têxtus")
                            .accessibilityValue(
                                selectedOption == .texts
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Deslize para baixo para selecionar têxtus.")
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
                            .accessibilityLabel("Têxtus")
                            .accessibilityValue(
                                selectedOption == .bubbles
                                ? "Selecionado"
                                : "Não selecionado"
                            )
                            .accessibilityHint("Toque duas vezes para selecionar têxtus.")
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
            Image(uiImage: background.wallpaper.image)
                .resizable()
                .scaledToFill()
                .accessibilityLabel(background.wallpaper.description)
        )
        .onTapGesture { apGesture in
            indexTapped = nil
            updateList(stickerID: UUID())
        }
        .overlay {
            ForEach(Array(selectedItens.enumerated()), id: \.offset) { index, item in
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
                            } label: {
                                Image(systemName: "trash")
                                    .bold()
                                    .foregroundStyle(.primaryPink)
                                    .frame(width: 35, height: 35)
                                    .background(.white)
                                    .border(.borderPink, width: 2)
                            }
                            .padding(.leading, sizeScreenWidth * 0.82)
                            .padding(.top, postHeight * 0.16)
                            
                            Button {
                                item.decreaseSize(size: 10)
                            } label: {
                                Image(systemName: "minus")
                                    .bold()
                                    .foregroundStyle(.primaryPink)
                                    .frame(width: 35, height: 35)
                                    .background(.white)
                                    .border(.borderPink, width: 2)
                            }
                            .padding(.leading, sizeScreenWidth * 0.82)
                            .padding(.top, postHeight * -0.03)
                            
                            Button {
                                item.increaseSize(size: 10)
                            } label: {
                                Image(systemName: "plus")
                                    .bold()
                                    .foregroundStyle(.primaryPink)
                                    .frame(width: 35, height: 35)
                                    .background(.white)
                                    .border(.borderPink, width: 2)
                            }
                            .padding(.leading, sizeScreenWidth * 0.82)
                            .padding(.top, postHeight * -0.15)
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
                    .accessibilityHidden(true)
            }
        }
    }
}

//#Preview {
//    CreatePostView()
//}
