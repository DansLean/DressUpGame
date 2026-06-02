//
//  Doll.swift
//  DressUpGame
//
//  Created by User on 28/04/26.
//

import SwiftUI


@Observable
class WallpaperClass: Identifiable {
    var wallpaper: UIImage
    
    init(wallpaper: UIImage) {
        self.wallpaper = wallpaper
    }
    
    func setWallpaper(wallpaper: UIImage) {
        self.wallpaper = wallpaper
    }
}

struct WallpaperView: View {
    let wallpaper: WallpaperClass
    var body: some View {
        Image(uiImage: wallpaper.wallpaper)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
}

