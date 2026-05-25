import SwiftUI
import PhotosUI
import SwiftData

struct PhotoPicker: View {
    
    var pinkColor = Color(red: 224/255.0, green: 33/255.0, blue: 137/255.0)
    
    @State private var photoItem: PhotosPickerItem? = nil
    @State private var photoImage = Image("capa de filme1")
    @State private var photoData : Data? = nil
    
    var onImageSelected: (Data?) -> Void
        
    var body: some View {
        PhotosPicker(selection: $photoItem) {
            Group {

                if let photoData, let uiImage = UIImage(data: photoData){
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                } else {
                    Image(systemName: "photo.badge.plus.fill")
                        .foregroundColor(pinkColor)
                        .font(.title)
                        .frame(height: 300)
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                
                }
            }
            .onChange(of: photoItem) {
                guard let photoItem else { return }
                Task { @MainActor in
                    photoData = try await photoItem.loadTransferable(type: Data.self)
                    onImageSelected(photoData)
                }
            }
        }
        
    }
}

