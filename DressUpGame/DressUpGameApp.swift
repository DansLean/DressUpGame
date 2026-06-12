//
//  DressUpGameApp.swift
//  DressUpGame
//
//  Created by User on 22/04/26.
//

import SwiftUI


enum PostOptions {
    case stickers
    case palettes
    case bubbles
    case texts
}

enum AvatarOptions {
    case face
    case hair
    case top
    case bottom
    case shoes
    case accessories
}

struct Asset: Hashable {
    let id = UUID()
    let image: UIImage
    let description: String
}

struct AssetColor: Hashable {
    let id = UUID()
    let color: Color
}

@main
struct DressUpGameApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
