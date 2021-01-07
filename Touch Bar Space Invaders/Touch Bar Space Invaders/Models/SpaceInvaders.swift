//
//  SpaceInvaders.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import Foundation

struct SpaceInvaders {
    /// Current score of the game.
    private(set) var score = 0

    /// Amount of lives (a.k.a. hearts) remaining.
    ///
    /// - Note: The game starts out with three lives.
    private(set) var heartsRemaining = 3
    
    /// Aliens in gameplay.
    private(set) var aliens: [Alien] = {
        return []
    }()

    /// Barricades in gameplay.
    private(set) var barricades: [Barricade] = {
       return []
    }()

    /// Spaceship in gameplay.
    var spaceship: Spaceship = Spaceship(
        x: Double(GameWindowWidth/2),
        y: Double(GameWindowHeight - GameplayInformationHeight - SpaceshipHeight/2)
    )
    
    /// Runs the next iteration of  the game loop.
    mutating func loop() {
        // Update the each bullet's position.
        spaceship.bullets.enumerated().forEach { index, bullet in
            spaceship.bullets[index].move(by: Bullet.stride)
        }
    }
}
