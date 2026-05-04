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

@main
struct DressUpGameApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}


