//
//  LevelView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/11/21.
//

import SwiftUI

struct LevelView: View {
    @EnvironmentObject var game: TouchBarSpaceInvaders
    @State private var labelIsShowing = false

    var body: some View {
        ZStack {
            if labelIsShowing {
                Text("LEVEL \(game.level)")
                    .font(font)
                    .transition(.opacity)
            }
        }
        .onAppear {
            withAnimation(Animation.easeIn(duration: 1.0)) {
                labelIsShowing = true
            }
        }
        .onDisappear {
            withAnimation(Animation.easeIn(duration: 1.0)) {
                labelIsShowing = false
            }
        }
    }
    
    // MARK: - Drawing Constant[s]
    
    private let font: Font = .system(size: 32)
}
