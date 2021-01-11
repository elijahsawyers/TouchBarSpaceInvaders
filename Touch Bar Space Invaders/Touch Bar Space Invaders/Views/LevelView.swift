//
//  LevelView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/11/21.
//

import SwiftUI

struct LevelView: View {
    @EnvironmentObject var game: TouchBarSpaceInvaders

    var body: some View {
        Text("LEVEL \(game.level)")
            .font(font)
    }
    
    // MARK: - Drawing Constant[s]
    
    private let font: Font = .system(size: 32)
}
