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
    var body: some View {
        NavigationStack {
            ZStack (alignment: .bottom) {
                VStack (spacing: 0) {
                    Spacer()
                    Spacer()
                    Rectangle()
                        .frame(height: 1, alignment: .top)
                        .foregroundColor(Color.borderPink)
                    postGroup
                        .clipShape(.rect(cornerRadius: 6))
                    Rectangle()
                        .frame(height: 1, alignment: .top)
                        .foregroundColor(Color.borderPink)
                    Spacer()
                    Rectangle()
                        .frame(height: 0.5, alignment: .top)
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
                    .ignoresSafeArea()
                }
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
                        HStack {
                            ShareLink(
                                item: renderedImage,
                                preview: SharePreview(
                                    Text("Post"),
                                    image: renderedImage
                                )
                            ) {
                                Image("shareButton")
                            }
                            .id(changes)
                        }
                    }
                    .sharedBackgroundVisibility(.hidden)
                }
                .navigationBarBackButtonHidden(true)
            }
            .background(.lightgreenGradient)
            .ignoresSafeArea()
        }
    }
    
    var renderedImage: Image {
        let renderer = ImageRenderer(content: postGroup)
        renderer.scale = displayScale
        //        renderer.scale =
        
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
                        Image("stickerButton")
                    }
                    .frame(width: 101, height: 60)
                    .border(Color.borderPink, width: 1)
                }
            } else {
                Button {
                    selectedOption = .stickers
                } label: {
                    ZStack {
                        Image("stickerButton")
                            
                    }
                    
                    .frame(width: 101, height: 60)
                    .background(.white)
                    .border(Color.borderPink, width: 1)
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
                        Image("paletteButton")
                    }
                    .frame(width: 101, height: 60)
                    .border(Color.borderPink, width: 1)
                }
                
                
            } else {
                Button {
                    selectedOption = .palettes
                } label: {
                    ZStack {
                        Image("paletteButton")
                    }
                    .frame(width: 101, height: 60)
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
                        Image("bubbleButton")
                    }
                    .frame(width: 101, height: 60)
                    .border(Color.borderPink, width: 1)
                }
            } else {
                Button {
                    selectedOption = .bubbles
                } label: {
                    ZStack {
                        Image("bubbleButton")
                    }
                    .frame(width: 101, height: 60)
                    .background(.white)
                    .border(Color.borderPink, width: 1)
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
                        Image("textButton")
                    }
                    .frame(width: 101, height: 60)
                    .border(Color.borderPink, width: 1)
                }
            } else {
                Button {
                    selectedOption = .texts
                } label: {
                    ZStack {
                        Image("textButton")
                    }
                    .frame(width: 101, height: 60)
                    .background(.white)
                    .border(Color.borderPink, width: 1)
                }
            }
        }
    }
    
    var postGroup: some View {
        
        ZStack {
            
            DollView(doll: doll)
            
        }
        .frame(width: .infinity, height: 400)
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
                    .padding(.leading, 270)
                    .padding(.top, 270)
            }
        }
        
    }
    
    
}


//#Preview {
//    CreatePostView()
//}
