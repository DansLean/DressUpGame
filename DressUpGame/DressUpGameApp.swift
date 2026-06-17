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
    let name: String
}

@main
struct DressUpGameApp: App {
    @AppStorage("isFirstLaunch") private var isFirstLaunch = true
    
    var body: some Scene {
        WindowGroup {
            if isFirstLaunch {
                OnboardingView(isFirstLaunch: $isFirstLaunch)
            } else {
                HomeView()
            }
        }
    }
}
