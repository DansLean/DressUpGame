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
        self.description = wallpaper.desc
    }
    
    func setWallpaper(wallpaper: Asset) {
        self.wallpaper = wallpaper
        self.description = wallpaper.desc
    }
}

struct WallpaperView: View {
    let wallpaper: WallpaperClass
    var body: some View {
        Image(wallpaper.wallpaper.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
            .accessibilityLabel(wallpaper.description)
    }
}
