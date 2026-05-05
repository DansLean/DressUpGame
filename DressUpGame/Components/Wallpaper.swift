//
//  Doll.swift
//  DressUpGame
//
//  Created by User on 28/04/26.
//

import SwiftUI


@Observable
class WallpaperClass: Identifiable {
    var wallpaper: Int
    
    init(wallpaper: Int) {
        self.wallpaper = wallpaper
    }
    
    func setWallpaper(wallpaper: Int) {
        self.wallpaper = wallpaper
    }
}

struct WallpaperView: View {
    let wallpaper: WallpaperClass
    var body: some View {
        Image("Background\(wallpaper.wallpaper)")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .ignoresSafeArea()
    }
    
}

