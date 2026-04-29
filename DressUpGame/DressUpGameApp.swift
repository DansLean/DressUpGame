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


@main
struct DressUpGameApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}


