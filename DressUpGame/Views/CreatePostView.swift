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
    @State var selectedOption: PostOptions = .stickers
    var wallpaper: Image?
    @State var selectedItens: [ModelTest] = []
    var body: some View {
        NavigationStack {
            ZStack {
                
//                Image("backgroundFill")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .ignoresSafeArea()
                
                VStack (alignment: .center, spacing: 0) {
                    
                    ZStack {
                        Image("Doll")
                            .resizable()
                            .scaledToFit()
                            .padding(.top, 28)
                            .padding(.bottom, 37)
//                            .frame(width: 200, height: 450)
//                            .position(x: 200, y: 330)
                        
                        
                        
                    }
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .bottomTrailing, content: {
                        Button {
                            // Button actions here.
                        } label: {
                            Image("zoom_button")
                        }
                        .shadow(radius: 2, y: 2)
                        .padding(.trailing)
//                        .position(x: 350, y: 248)
                    })
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
                        Button {
                            // Button actions here.
                        } label: {
                            Image("shareButton")
                        }
                        .shadow(radius: 2, y: 2)
                        
                    }
                    .sharedBackgroundVisibility(.hidden)
                }
                //            .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            }
            .background {
                Image("backgroundFill" ?? "\(wallpaper)")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
            }
            
//            .ignoresSafeArea()
        }
        
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

}


#Preview {
    CreatePostView()
}
