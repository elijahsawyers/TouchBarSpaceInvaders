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
    @State private var aliensShowing = false

    var body: some View {
        ZStack {
            ForEach(game.aliens) { alien in
                if !alien.isDead && aliensShowing {
                    AlienView(armsDown: true)
                        .position(x: CGFloat(alien.x), y: CGFloat(alien.y))
                        .animation(alienAnimation)
                        .transition(.opacity)
                }
            }
        }
        .onAppear {
            withAnimation {
                aliensShowing = true
            }
        }
    }
    
    // MARK: - Drawing Constant[s]
    
    private let alienAnimation: Animation = .linear(duration: 0.10)
}
