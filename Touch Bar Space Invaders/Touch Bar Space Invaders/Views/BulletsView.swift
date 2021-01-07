//
//  BulletsView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/7/21.
//

import SwiftUI

struct BulletsView: View {
    @EnvironmentObject private var game: TouchBarSpaceInvaders

    var body: some View {
        ForEach(game.spaceshipBullets) { bullet in
            BulletView()
                .position(x: CGFloat(bullet.x), y: CGFloat(bullet.y))
                .animation(bulletAnimation)
        }
    }
    
    // MARK: - Drawing Constant[s]
    
    private let bulletAnimation: Animation = .linear
}
