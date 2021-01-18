//
//  GameplayInformationView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/6/21.
//

import SwiftUI

struct GameplayInformationView: View {
    @State private var gameplayInformationIsShowing = false

    var body: some View {
        ZStack {
            if gameplayInformationIsShowing {
                // Black background.
                Rectangle()
                    .frame(height: GameplayInformationHeight)
                    .position(x: GameWindowWidth / 2, y: GameWindowHeight - GameplayInformationHeight/2)
                    .foregroundColor(.black)
                
                // White dividing line.
                Rectangle()
                    .frame(height: 1)
                    .position(x: GameWindowWidth / 2, y: GameWindowHeight - GameplayInformationHeight)

                // Gamplay information.
                HStack {
                    HeartsRemainingView()
                    Spacer()
                    CurrentScoreView()
                }
                    .position(x: GameWindowWidth / 2, y: GameWindowHeight - GameplayInformationHeight / 2)
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 1.0)) {
                gameplayInformationIsShowing = true
            }
        }
    }
}
