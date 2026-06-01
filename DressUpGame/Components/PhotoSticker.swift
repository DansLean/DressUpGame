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
                        .resizable()
                        .scaledToFit()
                        .font(.title)
                        .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                            if axis == .vertical {
                                return length * 0.33
                            } else {
                                return length * 0.25
                            }
                        }
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
                        submitPermission()
                    }
                }
                
                ZStack {
                    if let sticker {
                        Image(uiImage: sticker)
                            .resizable()
                            .scaledToFit()
                            .border(.red)
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.33
                                } else {
                                    return length * 1
                                }
                            }
                        
                    } else {
                        if image != nil {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                    if axis == .vertical {
                                        return length * 0.33
                                    } else {
                                        return length * 1
                                    }
                                }
                        }
                    }
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.33
                    } else {
                        return length * 1
                    }
                }
                
                if let image {
                    ImageLift(image: image, subject: $sticker)
                        .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                            if axis == .vertical {
                                return length * 0.33
                            } else {
                                return length  * 1
                            }
                        }
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
                    .disabled(submitPermission())
                }
            }
            .interactiveDismissDisabled(true)
        }
    }
    
    func submitPermission() -> Bool {
        if (image != nil) {
            return false
        } else {
            return true
        }
    }
}
