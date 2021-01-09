//
//  TouchBarSpaceInvadersView.swift
//  Shared
//
//  Created by Elijah Sawyers on 1/5/21.
//

import SwiftUI

struct TouchBarSpaceInvadersView: View {
    @EnvironmentObject var game: TouchBarSpaceInvaders

    var body: some View {
        ZStack {
            StarryBackgroundView()
            if !game.gameOver {
                AlienSwarmView()
                BulletsView()
                SpaceshipView()
                GameplayInformationView()
            } else {
                GameOverView()
            }
        }
        .frame(width: GameWindowWidth, height: GameWindowHeight)
    }
}
