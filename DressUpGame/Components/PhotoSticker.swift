//
//  PhotoSticker.swift
//  DressUpGame
//
//  Created by Daniel Leandro Campos Silva on 01/06/26.
//

import SwiftUI
import PhotosUI

struct PhotoSticker: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State private var selection: PhotosPickerItem? = nil
    @State private var image: UIImage? = nil
    
    @State private var sticker: UIImage?
    
    var onSelect: (UIImage) -> Void
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selection) {
                    Image(systemName: "photo.badge.plus.fill")
                        .font(.title)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .foregroundColor(.primaryPink)
                }
                .onChange(of: selection) {
                    guard let selection else { return }
                    Task { @MainActor in
                        guard
                            let data = try await selection.loadTransferable(
                                type: Data.self
                            )
                        else {
                            return
                        }
                        image = UIImage(data: data)
                    }
                }
                
                ZStack {
                    if let sticker {
                        Image(uiImage: sticker)
                            .resizable()
                    }
                }
                .border(.red)
                .frame(width: 100, height: 100)
                
                if let image {
                    ImageLift(image: image, subject: $sticker)
                }
            }
            .toolbar {
                if #available(iOS 26.0, *) {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        .foregroundColor(.primaryPink)
                        .cornerRadius(50)
                    }
                    .sharedBackgroundVisibility(.hidden)
                } else {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Text("Cancel")
                        }
                        .foregroundColor(.primaryPink)
                        .cornerRadius(50)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        if let sticker {
                            onSelect(sticker)
                            dismiss()
                        }
                    } label: {
                        Text("Confirm")
                    }
                    .foregroundColor(.primaryPink)
                    .cornerRadius(50)
                    .disabled(sticker == nil)
                }
            }
            .interactiveDismissDisabled(true)
        }
    }
}
