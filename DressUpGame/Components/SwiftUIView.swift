//
//  SwiftUIView.swift
//  DressUpGame
//
//  Created by Vírna Carvalho on 26/05/26.
//

import SwiftUI

struct Stickers: Identifiable {
    let id = UUID()
    let image: UIImage
}

struct SwiftUIView: View {
    
    @State var stickers = [
        Stickers(image: UIImage(resource: .sticker1)),
        Stickers(image: UIImage(resource: .sticker2)),
        Stickers(image: UIImage(resource: .sticker4)),
    ]
    
    var body: some View {
        VStack {
            ForEach(stickers) { sticker in
                Image(uiImage: sticker.image)
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            PhotoPicker() { data in
                if let data {
                    let sticker = Stickers(image: UIImage(data: data)!)
                    stickers.append(sticker)
                }
            }
        }
    }
    
}

#Preview {
    SwiftUIView()
}
