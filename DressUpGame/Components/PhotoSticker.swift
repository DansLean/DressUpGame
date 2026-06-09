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
            VStack(alignment: .leading) {
                Text("Choose your photo")
                    .foregroundColor(.primaryPink)
                    .font(.title)
                    .bold()
                    .padding(.top, 150)
                    
                
                Text("Upload a photo to remove the background")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                if axis == .vertical {
                    return length * 0.4
                } else {
                    return length * 1
                }
            }
            .padding(.trailing, 80)
            .padding(.top, 30)
            
            VStack {
                PhotosPicker(selection: $selection) {
                    VStack {
                        if image != nil {
                            if let image {
                                ImageLift(image: image, subject: $sticker)
                                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                        if axis == .vertical {
                                            return length * 0.30
                                        } else {
                                            return length * 0.85
                                        }
                                    }
                            }
                        }
                        else {
                            Image(systemName: "photo.badge.plus.fill")
                                .resizable()
                                .scaledToFit()
                                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                    if axis == .vertical {
                                        return length * 0.1
                                    } else {
                                        return length * 0.20
                                    }
                                }
                            
                                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                    if axis == .vertical {
                                        return length * 0.30
                                    } else {
                                        return length * 0.85
                                    }
                                }
                                .foregroundColor(.gray4)
                            
                                .background(.gray6)
                                .cornerRadius(20)
                        }
                    }
 
                }
                .foregroundColor(.gray4)
                .background(.gray6)
                .cornerRadius(20)
                //                            .border(.gray)
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
                .padding(.bottom, 60)
                
                ZStack {
                    if let sticker {
                        Image(uiImage: sticker)
                            .resizable()
                            .scaledToFit()
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.3
                                } else {
                                    return length * 0.85
                                }
                            }
                            
                            .background(.clear)
                            .cornerRadius(20)
                            .overlay (
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(.gray6, lineWidth: 2)
                            )
                    } else {
                        if image != nil {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle())
                        }
                    }
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.2
                    } else {
                        return length * 1
                    }
                }
                
                
//                VStack {
//                    if let image {
//                        ImageLift(image: image, subject: $sticker)
//                    }
//                }
//                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
//                    if axis == .vertical {
//                        return length * 0.4
//                    } else {
//                        return length  * 1
//                    }
//                }
            }
            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                if axis == .vertical {
                    return length * 0.7
                } else {
                    return length * 1
                }
            }
            
            //            .background(.lightgreenGradient)
            VStack {
                Text("")
                    .foregroundColor(.gray)
                    .font(.footnote)
            }
            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                if axis == .vertical {
                    return length * 0.4
                } else {
                    return length * 1
                }
            }
            
            .toolbar {
                if #available(iOS 26.0, *) {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image("Multiply")
                                .padding(.top, 25)
                        }
                        .foregroundColor(.primaryPink)
                        //                        .cornerRadius(50)
                    }
                    .sharedBackgroundVisibility(.hidden)
                    
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            if let sticker {
                                onSelect(sticker)
                                dismiss()
                            }
                        } label: {
                            Image("Checkmark")
                                .padding(.top, 25)
                        }
                        .foregroundColor(.primaryPink)
                        //                    .cornerRadius(50)
                        .disabled(submitPermission())
                    }
                    .sharedBackgroundVisibility(.hidden)
                } else {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Image("Multiply")
                                .padding(.top, 25)
                        }
                        .foregroundColor(.primaryPink)
                        //                        .cornerRadius(50)
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            if let sticker {
                                onSelect(sticker)
                                dismiss()
                            }
                        } label: {
                            Image("Checkmark")
                                .padding(.top, 25)
                        }
                        .foregroundColor(.primaryPink)
                        //                    .cornerRadius(50)
                        .disabled(submitPermission())
                    }
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
