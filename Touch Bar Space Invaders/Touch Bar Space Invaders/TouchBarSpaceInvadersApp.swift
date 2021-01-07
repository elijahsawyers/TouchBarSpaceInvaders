//
//  TouchBarSpaceInvadersApp.swift
//  Shared
//
//  Created by Elijah Sawyers on 1/5/21.
//

import SwiftUI

@main
struct TouchBarSpaceInvadersApp: App {
    let game = TouchBarSpaceInvaders()

    var body: some Scene {
        WindowGroup {
            TouchBarSpaceInvadersView()
                .environmentObject(game)
        }
    }
}
