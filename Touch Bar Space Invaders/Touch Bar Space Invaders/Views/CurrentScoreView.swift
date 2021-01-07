//
//  CurrentScoreView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/7/21.
//

import SwiftUI

struct CurrentScoreView: View {
    @EnvironmentObject private var game: TouchBarSpaceInvaders

    var body: some View {
        Text("SCORE: \(game.score)")
            .padding(.horizontal)
            .font(scoreFont)
    }

    // MARK: - Drawing Constant[s]
    
    private let scoreFont: Font = .system(size: 24, design: .monospaced)
}
