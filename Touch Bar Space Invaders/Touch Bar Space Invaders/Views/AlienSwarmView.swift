//
//  AlienSwarmView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/6/21.
//

import SwiftUI
import Combine

struct AlienSwarmView: View {
    @EnvironmentObject private var game: TouchBarSpaceInvaders

    var body: some View {
        ForEach(game.aliens) { alien in
            if !alien.isDead {
                AlienView(armsDown: true)
                    .position(x: CGFloat(alien.x), y: CGFloat(alien.y))
                    .animation(alienAnimation)
            } else {
                EmptyView()
                    .frame(width: AlienSize, height: AlienSize)
                    .position(x: CGFloat(alien.x), y: CGFloat(alien.y))
            }
        }
    }
    
    // MARK: - Drawing Constant[s]
    
    private let alienAnimation: Animation = .linear(duration: 0.10)
}
