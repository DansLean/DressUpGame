
//
//  ImageLiftView.swift
//  DressUpGame
//
//  Created by Vírna Carvalho on 25/05/26.
//
import SwiftUI

struct ImageLiftView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var imgData: Data?
    var pinkColor = Color(red: 224/255.0, green: 33/255.0, blue: 137/255.0)
    var body: some View {
        NavigationView {
            if let imageData = imgData {
                ImageLift(imageData: imageData)
                    .toolbar {
                        if #available(iOS 26.0, *) {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    self.presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Text("Cancel")
                                }
                                .background(pinkColor)
                                .foregroundColor(.white)
                                .cornerRadius(50)
                            }
                            .sharedBackgroundVisibility(.hidden)
                        } else {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    self.presentationMode.wrappedValue.dismiss()
                                } label: {
                                    Text("Cancel")
                                }
                                .background(pinkColor)
                                .cornerRadius(50)
                            }
                            
                            
                        }
                        
                        
                    }
                    .interactiveDismissDisabled(true)
            }
        }

    }
}

#Preview {
    ImageLiftView(imgData: .constant(nil))
}
