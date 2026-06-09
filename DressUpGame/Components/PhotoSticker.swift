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
                    .padding(.leading, 30)
                    .padding(.bottom, 5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Upload a photo to remove the background")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .padding(.leading, 30)
            }
            
            VStack (spacing: 5) {
                PhotosPicker(selection: $selection) {
                    VStack {
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
                        //                            .font(.body)
                        //    .clipShape(RoundedRectangle(cornerRadius: 10))
                            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                                if axis == .vertical {
                                    return length * 0.30
                                } else {
                                    return length * 0.85
                                }
                            }
                            .foregroundColor(.gray4)
                        //                            .frame(maxWidth: .infinity, alignment: .center)
                            .background(.gray6)
                            .cornerRadius(20)
                        //                            .border(.gray)
                    }
                    //                    .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    //                        if axis == .vertical {
                    //                            return length * 1.4
                    //                        } else {
                    //                            return length * 1
                    //                        }
                    //                    }
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
                
                ZStack {
                    if let sticker {
                        Image(uiImage: sticker)
                            .resizable()
                            .scaledToFit()
                            .border(.red)
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
                
                VStack {
                    if let image {
                        ImageLift(image: image, subject: $sticker)
                    }
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.4
                    } else {
                        return length  * 1
                    }
                }
            }
            .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                if axis == .vertical {
                    return length * 1
                } else {
                    return length * 1
                }
            }
            //            .background(.lightgreenGradient)
            
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
