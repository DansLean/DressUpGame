//
//  CreatePostView.swift
//  DressUpGame
//
//  Created by USER on 27/04/26.
//

import SwiftUI

//enum Wallpapers {
//    case op1
//    case op2
//    case op3
//    case op4
//    case op5
//    case op6
//    case op7
//    case op8
//    case op9
//    case op10
//}


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


class Teste: Identifiable {
    var imageWallpaper: Image
    
    init(imageWallpaper: Image) {
        self.imageWallpaper = imageWallpaper
    }
    
}

struct CreatePostView: View {
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.displayScale) var displayScale
    @State var selectedOption: PostOptions = .stickers
    @State var renderedImage = Image("shareButton")
    @State private var showActivityControllerView: Bool = false
    //    var wallpaper: Wallpapers
    //    var teste : Teste
    @State var selectedItens: [ModelTest] = []
    
    var mainView: some View {
        VStack {
            Text("Blalabla")
        }
    }
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                VStack (alignment: .center, spacing: 0) {
                    
                    postGroup
                        .overlay(alignment: .bottomTrailing, content: {
                            Button {
                                // Button actions here.
                            } label: {
                                Image("zoom_button")
                            }
                            .shadow(radius: 2, y: 2)
                            .padding(.trailing)
                        })
                    
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
                    .background(Color.white)
                    
                    DecorationItens(selectedOption: $selectedOption) { tapped in
                        if (selectedOption == .palettes) {
                            //                            teste == Teste(imageWallpaper: tapped)
                        } else {
                            let newItem = ModelTest(imageName: tapped, position: .init(x: 200, y: 200))
                            selectedItens.append(newItem)
                        }
                        
                    }
                    
                    
                    
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
                            
                            ShareLink("Export", item: renderedImage, preview: SharePreview(Text("Shared Image"), image: renderedImage))
                                .onTapGesture {
                                    render()
                                }
                                
                            
                            //                            postGroup
                            //                                .padding()
                            //                            renderedImage
                            //                                .resizable()
                            //                                .padding()
//                                                        Button {
//                                                            render()
//                                                        } label: {
//                                                            Image("shareButton")
//                                                        }
//                                                        .shadow(radius: 2, y: 2)
                        }
                        
                        
                    }
                    .sharedBackgroundVisibility(.hidden)
                }
                //            .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            }
            
            .background {
                Image("backgroundFill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            }
            
            //            .ignoresSafeArea()
        }
        
        
    }
    
    @MainActor
    func render() {
        let renderer = ImageRenderer(content: postGroup)
        renderer.scale = displayScale
        
        if let uiImage = renderer.uiImage {
            renderedImage = Image(uiImage: uiImage)
        }
    }
    
    //    var selectedWallpaper : String {
    ////        switch wallpaper {
    ////        case .op1:
    ////            return "11"
    ////        case .op2:
    ////            return "12"
    ////        case .op3:
    ////            return "13"
    ////        case .op4:
    ////            return "14"
    ////        case .op5:
    ////            return "15"
    ////        }
    ////
    //        if (wallpaper == .op1) {
    //            return "11"
    //        }
    //        else if (wallpaper == .op2) {
    //            return "12"
    //        }
    //        else if (wallpaper == .op3) {
    //            return "13"
    //        }
    //        else if (wallpaper == .op4) {
    //            return "14"
    //        }
    //        else if (wallpaper == .op5) {
    //            return "15"
    //        }
    //        else {
    //            return "backgroundFill"
    //        }
    //    }
    
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
                    .border(Color.borderPink, width: 1)
                }
            }
        }
    }
    
    var postGroup: some View {
        ZStack {
            ZStack {
                Image("Doll")
                    .resizable()
                    .scaledToFit()
                    .padding(.top, 28)
                    .padding(.bottom, 37)
                
            }
            .frame(maxWidth: .infinity)
            
            .overlay {
                ForEach(selectedItens) { item in
                    item.imageName
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .position(item.position)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    item.position = gesture.location
                                }
                        )
                }
                
            }
            
        }
    }
    
}


#Preview {
    CreatePostView()
}
