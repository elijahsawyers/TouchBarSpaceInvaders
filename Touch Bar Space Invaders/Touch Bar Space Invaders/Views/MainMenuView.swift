//
//  MainMenuView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/10/21.
//

import SwiftUI

struct MainMenuView: View {
    @EnvironmentObject var game: TouchBarSpaceInvaders
    @State private var title = ""
    @State private var subtitle = ""
    @State private var buttonLabel = ""

    var body: some View {
        VStack {
            Text(title)
                .font(titleFont)
            Text(subtitle)
                .font(subtitleFont)
            ZStack {
                RoundedRectangle(cornerRadius: buttonCornerRadius)
                    .foregroundColor(buttonColor)
                Text(buttonLabel)
                    .font(buttonLabelFont)
            }
            .frame(width: buttonFrame.width, height: buttonFrame.height)
            .onTapGesture {
                game.newGame()
            }
            .onAppear {
                if game.gameOver {
                    game.updateHighScore(to: game.score)
                }
                title = game.gameOver ? "GAME OVER" : "TOUCH BAR SPACE INVADERS"
                subtitle = game.gameOver ? "SCORE: \(game.score)" : "HIGH SCORE: \(game.highScore)"
                buttonLabel = game.gameOver ? "New Game" : "Start Game"
            }
        }
    }
    
    // MARK: - Drawing Constant[s]
    
    private let titleFont = Font.system(size: 42).bold()
    private let subtitleFont = Font.system(size: 24)
    private let buttonCornerRadius: CGFloat = 10.0
    private let buttonColor: Color = .green
    private let buttonLabelFont = Font.system(size: 16).bold()
    private let buttonFrame: CGSize = CGSize(width: 150, height: 40)
}
