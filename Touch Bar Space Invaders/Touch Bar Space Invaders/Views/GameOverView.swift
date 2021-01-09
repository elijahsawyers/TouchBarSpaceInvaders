//
//  GameOverView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/9/21.
//

import SwiftUI

struct GameOverView: View {
    @EnvironmentObject var game: TouchBarSpaceInvaders

    var body: some View {
        VStack {
            Text("GAME OVER")
                .font(Font.system(size: 42).bold())
            Text("SCORE: \(game.score)")
                .font(Font.system(size: 24))
            ZStack {
                RoundedRectangle(cornerRadius: 10.0)
                    .foregroundColor(.green)
                Text("New Game")
                    .font(Font.system(size: 16).bold())
            }
            .frame(width: 150, height: 40)
            .onTapGesture {
                game.newGame()
            }
        }
    }
}

