//
//  DecorationItens.swift
//  DressUpGame
//
//  Created by USER on 28/04/26.
//

import SwiftUI
import PhotosUI

struct Sticker: Identifiable {
    let id = UUID()
    let image: UIImage
}


//struct DecorationItens: View {
//
//    @State var stickers = [
//        Sticker(image: UIImage(resource: .sticker1)),
//        Sticker(image: UIImage(resource: .sticker2)),
//        Sticker(image: UIImage(resource: .sticker3)),
//        Sticker(image: UIImage(resource: .sticker4)),
//        Sticker(image: UIImage(resource: .sticker5)),
//        Sticker(image: UIImage(resource: .sticker6)),
//        Sticker(image: UIImage(resource: .sticker7)),
//    ]

struct DecorationItens: View {
    
    @Binding var selectedOption: PostOptions
    @State private var showingAlert = false
    @State private var authorizationStatus = PHAuthorizationStatus.notDetermined
    var tap: (UIImage) -> Void
    
    @State var stickers = [
        Asset(image: UIImage(resource: .sticker1)),
        Asset(image: UIImage(resource: .sticker2)),
        Asset(image: UIImage(resource: .sticker3)),
        Asset(image: UIImage(resource: .sticker4)),
        Asset(image: UIImage(resource: .sticker5)),
        Asset(image: UIImage(resource: .sticker6)),
        Asset(image: UIImage(resource: .sticker7)),
    ]
    
    @State var palettes = [
        Asset(image: UIImage(resource: .background0)),
        Asset(image: UIImage(resource: .background1)),
        Asset(image: UIImage(resource: .background2)),
        Asset(image: UIImage(resource: .background3)),
        Asset(image: UIImage(resource: .background4)),
        Asset(image: UIImage(resource: .background5)),
        Asset(image: UIImage(resource: .background6)),
        Asset(image: UIImage(resource: .background7)),
        Asset(image: UIImage(resource: .background8)),
    ]
    
    
    @State var bubbles = [
        Asset(image: UIImage(resource: .bubble1)),
        Asset(image: UIImage(resource: .bubble2)),
        Asset(image: UIImage(resource: .bubble3)),
        Asset(image: UIImage(resource: .bubble4)),
    ]
    
    @State var texts = [
        Asset(image: UIImage(resource: .alphabet1)),
        Asset(image: UIImage(resource: .alphabet2)),
        Asset(image: UIImage(resource: .alphabet3)),
        Asset(image: UIImage(resource: .alphabet4)),
        Asset(image: UIImage(resource: .alphabet5)),
        Asset(image: UIImage(resource: .alphabet6)),
        Asset(image: UIImage(resource: .alphabet7)),
        Asset(image: UIImage(resource: .alphabet8)),
        Asset(image: UIImage(resource: .alphabet9)),
        Asset(image: UIImage(resource: .alphabet10)),
        Asset(image: UIImage(resource: .alphabet11)),
        Asset(image: UIImage(resource: .alphabet12)),
        Asset(image: UIImage(resource: .alphabet13)),
        Asset(image: UIImage(resource: .alphabet14)),
        Asset(image: UIImage(resource: .alphabet15)),
        Asset(image: UIImage(resource: .alphabet16)),
        Asset(image: UIImage(resource: .alphabet17)),
        Asset(image: UIImage(resource: .alphabet18)),
        Asset(image: UIImage(resource: .alphabet19)),
        Asset(image: UIImage(resource: .alphabet20)),
        Asset(image: UIImage(resource: .alphabet21)),
        Asset(image: UIImage(resource: .alphabet22)),
        Asset(image: UIImage(resource: .alphabet23)),
        Asset(image: UIImage(resource: .alphabet24)),
        Asset(image: UIImage(resource: .alphabet25)),
        Asset(image: UIImage(resource: .alphabet26)),
        Asset(image: UIImage(resource: .alphabet27)),
        Asset(image: UIImage(resource: .alphabet28)),
        Asset(image: UIImage(resource: .alphabet29)),
        Asset(image: UIImage(resource: .alphabet30)),
        Asset(image: UIImage(resource: .alphabet31)),
        Asset(image: UIImage(resource: .alphabet32)),
        Asset(image: UIImage(resource: .alphabet33)),
        Asset(image: UIImage(resource: .alphabet34))
    ]
    
    let sizeScreen: CGFloat = UIScreen.main.bounds.width + UIScreen.main.bounds.height / UIScreen.main.bounds.width
    let sizeScreenHeight: CGFloat = UIScreen.main.bounds.height
    
    var selectedNumbers: [Asset] {
        switch (selectedOption) {
        case .stickers:
            return stickers
        case .palettes:
            return palettes
        case .bubbles:
            return bubbles
        case .texts:
            return texts
        }
    }
    
    @State private var text: String = ""
    @State var isShowingCustomStickerPicker = false
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: Array(repeating: GridItem(.flexible()), count: 1)) {
                
                
                if selectedOption == .stickers {
                    Button (action: {
                        isShowingCustomStickerPicker = true
                        PHPhotoLibrary.requestAuthorization(for: .addOnly) {
                            status in authorizationStatus = status
                            if status == .denied {
                                showingAlert = true
                            }
                        }
                    }) {
                        
                        VStack (spacing: 10) {
                            Image("AddStickerButton")
                                .resizable()
                                .scaledToFit()
                                .font(.body)
                                .frame(width: 50, height: 50)
                                .foregroundColor(.primaryPink)
                            Text("Add Sticker")
                                .foregroundStyle(.primaryPink)
                                .font(.system(.body, weight: .semibold))
                        }
                        
                        //                        VStack (spacing: 8) {
                        //                            Label("Add Sticker",systemImage: "plus.circle.fill")
                        //                                .labelStyle(.iconOnly)
                        //                                .foregroundStyle(Color(.primaryPink))
                        //                                .font(.system(size: 50))
                        //                            Text("Add Sticker")
                        //                                .foregroundStyle(.primaryPink)
                        //                                .font(.system(.body, weight: .semibold))
                        //                        }
                    }
                    
                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                        if axis == .vertical {
                            return length * 1
                        } else {
                            return length * 0.4
                        }
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert (
                            title: Text("Permission denied."),
                            message: Text("To use this feature, you must grant access to your photo gallery."),
                            dismissButton: .default(Text("Allow")) {
                                if let settingURL = URL(string: UIApplication.openSettingsURLString),
                                   UIApplication.shared.canOpenURL(settingURL) {
                                    UIApplication.shared.open(settingURL)
                                }
                            }
                        )
                    }
                    
                }
                ForEach(selectedNumbers, id: \.self) { number in
                    Rectangle()
                        .overlay {
                            if self.selectedOption == .stickers {
                                Image(uiImage: number.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 1
                                        } else {
                                            return length * 0.2
                                        }
                                    }
                                    .sheet(isPresented: $isShowingCustomStickerPicker) {
                                        PhotoSticker(showingAlert: $showingAlert) {
                                            stickers.insert(Asset(image: $0), at: 0)
                                        }
                                    }
                            }
                            
                            if self.selectedOption == .palettes {
                                Image(uiImage: number.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 1.5
                                        } else {
                                            return length * 5
                                        }
                                    }
                                    .padding(.bottom, 0.02 * sizeScreen)
                            }
                            
                            if self.selectedOption == .bubbles {
                                Image(uiImage: number.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 2
                                        } else {
                                            return length * 0.25
                                        }
                                    }
                                    .padding(.bottom, 0.02 * sizeScreen)
                            }
                            
                            if self.selectedOption == .texts {
                                Image(uiImage: number.image)
                                    .resizable()
                                    .scaledToFit()
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 2
                                        } else {
                                            return length * 0.25
                                        }
                                    }
                                    .padding(.bottom, 0.02 * sizeScreen)
                            }
                        }
                        .aspectRatio(0.7, contentMode: .fit)
                        .onTapGesture {
                            tap(number.image)
                        }
                    
                }
            }
            .border(Color.borderPink, width: 0.5)
            .background(Color.white)
            .foregroundStyle(.white)
        }
    }
}
