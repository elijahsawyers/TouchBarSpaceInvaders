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
            if !game.gameCreated || game.gameOver {
                MainMenuView()
            } else if game.gameCreated && !game.gameOver {
                if game.gameInMotion {
                    BoundaryView()
                    AlienSwarmView()
                    BulletsView()
                    BarricadesRowView()
                } else {
                    LevelView()
                }
                SpaceshipView()
                GameplayInformationView()
            }
        }
        .frame(width: GameWindowWidth, height: GameWindowHeight)
    }
}
