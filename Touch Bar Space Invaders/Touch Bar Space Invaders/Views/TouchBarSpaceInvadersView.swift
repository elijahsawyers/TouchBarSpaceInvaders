//
//  TouchBarSpaceInvadersView.swift
//  Shared
//
//  Created by Elijah Sawyers on 1/5/21.
//

import SwiftUI

struct TouchBarSpaceInvadersView: View {
    var body: some View {
        ZStack {
            StarryBackgroundView()
            AlienSwarmView()
            SpaceshipView()
            GameplayInformationView()
        }
        .frame(width: GameWindowWidth, height: GameWindowHeight)
    }
}
