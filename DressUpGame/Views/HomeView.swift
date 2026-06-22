//
//  ContentView.swift
//  DressUpGame
//
//  Created by User on 22/04/26.
//

import SwiftUI
import SwiftData


struct HomeView: View {
    @State var doll = DollClass(face: Asset(image: "Doll1", gridImage: nil, desc: "Boneca com traços femininos de tom claro"),
               hair: Asset(image: "", gridImage: nil, desc: ""),
               hairColor: AssetColor(color: "grayColorNew", name: "Preto"),
               top: Asset(image: "", gridImage: nil, desc: ""),
               topColor: AssetColor(color: "grayColorNew", name: "Preto"),
               bottom: Asset(image: "", gridImage: nil, desc: ""),
               bottomColor: AssetColor(color: "grayColorNew", name: "Preto"), shoes: Asset(image: "", gridImage: nil, desc: ""),
               accessories: Asset(image: "", gridImage: nil, desc: "")
    )
    
    @State var background = WallpaperClass(wallpaper: Asset(image: "Background0", gridImage: nil, desc: "Papel de parede com degradê que transiciona entre as cores rosa e branco com formas hexagonais em branco"))
    
    @Query(sort: \DollClass.face.id)
    private var dolls: [DollClass]
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center)  {
                VStack(alignment: .center) {
//                    ForEach(dolls) { doll in
//                        DollView(doll: doll)
//                    }
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
                .overlay(
                    Rectangle()
                        .frame(width: nil, height: 3, alignment: .top)
                        .foregroundColor(.separator), alignment: .top)
                .accessibilityHint("Toque duas vezes para criar um novo look.")
            }
            .onAppear {
                doll = DollClass(face: Asset(image: "Doll1", gridImage: nil, desc: "Boneca com traços femininos de tom claro"),
                                 hair: Asset(image: "", gridImage: nil, desc: ""),
                                 hairColor: AssetColor(color: "grayColorNew", name: "Preto"),
                                 top: Asset(image: "", gridImage: nil, desc: ""),
                                 topColor: AssetColor(color: "grayColorNew", name: "Preto"),
                                 bottom: Asset(image: "", gridImage: nil, desc: ""),
                                 bottomColor: AssetColor(color: "grayColorNew", name: "Preto"), shoes: Asset(image: "", gridImage: nil, desc: ""),
                                 accessories: Asset(image: "", gridImage: nil, desc: "")
                      )
                background = WallpaperClass(wallpaper: Asset(image: "Background0", gridImage: nil, desc: "Papel de parede com degradê que transiciona entre as cores rosa e branco com formas hexagonais em branco"))
                
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
