//
//  SpaceInvaders.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import Foundation

struct SpaceInvaders {
    /// How much to increase score on alien death.
    private static let scoreIncrease = 10
    
    /// Current score of the game.
    private(set) var score = 0
    
    /// Current level of the game.
    private(set) var level = 1
    
    /// Whether or not all spaceship lives have been used up.
    private(set) var gameOver = false {
        didSet {
            if gameOver {
                gameInMotion = false
            }
        }
    }
    
    /// Whether or not the game is currently being played.
    private(set) var gameInMotion = false
    
    /// Whether or not a new game was created.
    private(set) var gameCreated = false
    
    /// Barricades in gameplay.
    private(set) var barricades: [Barricade] = {
       return []
    }()

    /// Aliens in gameplay.
    private(set) var alienSwarm = AlienSwarm()

    /// Spaceship in gameplay.
    var spaceship: Spaceship = .atStartPosition
    
    /// The time when the current level was started.
    var levelStartTime: Date? = Date()

    /// Runs the next iteration of  the game loop.
    mutating func loop() {
        gameCreated = true

        if let levelStartTime = levelStartTime, Date().timeIntervalSince(levelStartTime) > 3 {
            gameInMotion = true
            
            // Update each bullet's position.
            spaceship.updateBulletPositions()
            alienSwarm.updateBulletPositions()

            // Shoot from aliens.
            alienSwarm.shoot()
            
            // Update each aliens's position.
            alienSwarm.move()

            // Check if any of the spaceship bullets are touching an alien.
            if let spaceshipBulletsThatHitAnAlien = alienSwarm.bulletsHittingAnAlien(by: spaceship) {
                spaceshipBulletsThatHitAnAlien.forEach { bullet in spaceship.bulletMadeContact(bullet) }
                score += SpaceInvaders.scoreIncrease * spaceshipBulletsThatHitAnAlien.count
            }

            // Check if any of the alien bullets are touching the ship.
            if let bullet = spaceship.isShot(by: alienSwarm) {
                alienSwarm.bulletMadeContact(bullet)
                spaceship.heartsRemaining -= 1
                if spaceship.heartsRemaining == 0 {
                    gameOver = true
                }
            }
            
            // Respawn the aliens, and progress the level.
            if alienSwarm.allAliensDead { nextLevel() }
        }
    }
    
    /// Progress to the next level.
    mutating func nextLevel() {
        level += 1
        gameInMotion = false
        levelStartTime = Date()
        alienSwarm = AlienSwarm()
        spaceship.bullets = []
    }
}
