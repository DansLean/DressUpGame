//
//  DressUpGameApp.swift
//  DressUpGame
//
//  Created by User on 22/04/26.
//

import SwiftUI
import SwiftData

enum PostOptions: Codable {
    case stickers
    case palettes
    case bubbles
    case texts
}

enum AvatarOptions: Codable {
    case face
    case hair
    case top
    case bottom
    case shoes
    case accessories
}

struct Asset: Hashable, Codable {
    var id = UUID()
    let image: String
    let gridImage: String?
    let desc: String
}

struct AssetColor: Hashable, Codable {
    var id = UUID()
    let color: String
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
        .modelContainer(for: [DollClass.self])
    }
}
