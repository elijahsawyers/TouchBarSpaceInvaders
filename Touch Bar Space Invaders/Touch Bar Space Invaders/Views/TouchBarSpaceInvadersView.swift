//
//  TouchBarSpaceInvadersView.swift
//  Shared
//
//  Created by Elijah Sawyers on 1/5/21.
//

import SwiftUI
import AppKit

struct TouchBarSpaceInvadersView: View {
    var body: some View {
        ZStack {
            StarryBackgroundView()
            SpaceshipView()
        }
        .frame(width: GameWindowWidth, height: GameWindowHeight)
    }
}
