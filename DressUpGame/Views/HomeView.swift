//
//  ContentView.swift
//  DressUpGame
//
//  Created by User on 22/04/26.
//

import SwiftUI


struct HomeView: View {

    @State var doll = DollClass(face: Asset(image: UIImage(resource: .doll1), gridImage: nil, description: "Boneca com traços femininos de tom claro"), hair: Asset(image: UIImage(), gridImage: nil, description: ""), hairColor: .grayColorNew, top: Asset(image: UIImage(), gridImage: nil, description: ""), topColor: .grayColorNew, bottom: Asset(image: UIImage(), gridImage: nil, description: ""), bottomColor: .grayColorNew, shoes: Asset(image: UIImage(), gridImage: nil, description: ""), accessories: Asset(image: UIImage(), gridImage: nil, description: ""))
    

    @State var background = WallpaperClass(wallpaper: Asset(image: .background0, gridImage: nil, description: "Papel de parede com degradê que transiciona entre as cores rosa e branco com formas hexagonais em branco"))

    var body: some View {
        NavigationStack {
            VStack(alignment: .center)  {
                VStack(alignment: .center) {
                    Image("Doll1")
                        .resizable()
                        .scaledToFit()
                        .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                            if axis == .vertical {
                                return length * 0.55
                            } else {
                                return length
                            }
                        }
                        .accessibilityHidden(true)
                }
                .containerRelativeFrame([.horizontal, .vertical]) { length, axis in
                    if axis == .vertical {
                        return length * 0.75
                    } else {
                        return length
                    }
                }
                
                Button {
                    
                } label: {
                    NavigationLink(destination: CreateAvatarView(doll: $doll, background: $background)) {
                       
                            ZStack {
                                LinearGradient(gradient: Gradient(colors: [.lightgreenGradient, .greenGradient]), startPoint: .top, endPoint: .bottom)
                                VStack (spacing: 8) {
                                    Label("",systemImage: "plus.circle")
                                        .labelStyle(.iconOnly)
                                        .foregroundStyle(Color(.primaryPink))
                                        .font(.system(size: 58))
                                        .accessibilityHidden(true)
                                    Text("New Look")
                                        .foregroundStyle(.primaryPink)
                                        .font(.system(.body, weight: .semibold))
                                }
                            }
                        }
                        .overlay(Rectangle()
                            .frame(width: nil, height: 3, alignment: .top)
                            .foregroundColor(.separator), alignment: .top)
                        .simultaneousGesture(TapGesture().onEnded {
                            doll = DollClass(face: Asset(image: UIImage(resource: .doll1), gridImage: nil, description: "Boneca com traços femininos de tom claro"), hair: Asset(image: UIImage(), gridImage: nil, description: ""), hairColor: .grayColorNew, top: Asset(image: UIImage(), gridImage: nil, description: ""), topColor: .grayColorNew, bottom: Asset(image: UIImage(), gridImage: nil, description: ""), bottomColor: .grayColorNew, shoes: Asset(image: UIImage(), gridImage: nil, description: ""), accessories: Asset(image: UIImage(), gridImage: nil, description: ""))
                        })
                    }
                    .accessibilityHint("Toque três vezes para criar um novo look.")
                }
                .background(
                    Image("Background0")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .accessibilityHidden(true)
                )
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
            }
        }
    }

#Preview {
    HomeView()
}
