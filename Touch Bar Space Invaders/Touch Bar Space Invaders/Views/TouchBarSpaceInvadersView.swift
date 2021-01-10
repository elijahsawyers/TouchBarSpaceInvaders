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
            if !game.gameInMotion || game.gameOver {
                MainMenuView()
            } else {
                AlienSwarmView()
                BulletsView()
                SpaceshipView()
                GameplayInformationView()
            }
        }
        .frame(width: GameWindowWidth, height: GameWindowHeight)
    }
}
