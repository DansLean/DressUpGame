//
//  Doll.swift
//  DressUpGame
//
//  Created by User on 28/04/26.
//

import SwiftUI


@Observable
class WallpaperClass: Identifiable {
    var wallpaper: Asset
    var description: String
    
    init(wallpaper: Asset) {
        self.wallpaper = wallpaper
        self.description = wallpaper.description
    }
    
    func setWallpaper(wallpaper: Asset) {
        self.wallpaper = wallpaper
        self.description = wallpaper.description
    }
}

struct WallpaperView: View {
    let wallpaper: WallpaperClass
    var body: some View {
        Image(uiImage: wallpaper.wallpaper.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .accessibilityLabel(wallpaper.description)
    }
}
