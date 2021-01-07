//
//  SpaceInvaders.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import Foundation

struct SpaceInvaders {
    /// How many aliens the game starts with.
    static let alienCount = 25
    
    /// How much to increase score on alien death.
    static let scoreIncrease = 10
    
    /// Current score of the game.
    private(set) var score = 0

    /// Amount of lives (a.k.a. hearts) remaining.
    ///
    /// - Note: The game starts out with three lives.
    private(set) var heartsRemaining = 3
    
    /// Barricades in gameplay.
    private(set) var barricades: [Barricade] = {
       return []
    }()
    
    /// Whether or not the aliens are moving to the right.
    private var aliensMovingRight: Bool = true
    
    /// How much the alien swarm has been offset.
    private var alienSwarmOffset: Double = 0.0
    
    /// Aliens in gameplay.
    var aliens: [Alien] = {
        var aliens = [Alien]()
        let alienSpacing: Double = 75.0
        let offsetX = (Double(GameWindowWidth) - (4 * Double(AlienSize)) - (4 * alienSpacing)) / 2.0
        let offsetY = Double(AlienSize) / 2.0

        for i in 0..<5 {
            for j in 0..<5 {
                aliens.append(Alien(
                    x: (Double(AlienSize) + alienSpacing) * Double(j) + offsetX,
                    y: Double(AlienSize) * Double(i) + offsetY
                ))
            }
        }
        
        return aliens
    }()

    /// Spaceship in gameplay.
    var spaceship: Spaceship = Spaceship(
        x: Double(GameWindowWidth/2),
        y: Double(GameWindowHeight - GameplayInformationHeight - SpaceshipHeight/2)
    )
    
    /// Runs the next iteration of  the game loop.
    mutating func loop() {
        // Update each bullet's position.
        spaceship.bullets.enumerated().forEach { index, _ in
            spaceship.bullets[index].move(by: Bullet.stride)
        }
        
        // Update each aliens's position.
        var moveDown = false
        alienSwarmOffset += aliensMovingRight ? Alien.horizontalStride : -Alien.horizontalStride
        if alienSwarmOffset == 50.0 {
            aliensMovingRight = false
            moveDown = true
        } else if alienSwarmOffset == -50.0 {
            aliensMovingRight = true
            moveDown = true
        }
        aliens.enumerated().forEach { index, _ in
            if moveDown {
                aliens[index].move(y: Alien.verticalStride)
            }
            aliens[index].move(x: aliensMovingRight ? Alien.horizontalStride : -Alien.horizontalStride)
        }
        
        // Check if any of the bullets are touching an alien.
        spaceship.bullets.enumerated().forEach { bulletIndex, bullet in
            aliens.enumerated().forEach { alienIndex, alien in
                if !alien.isDead, madeContact(bullet, with: alien) {
                    spaceship.bullets.remove(at: bulletIndex)
                    aliens[alienIndex].isDead = true
                    score += SpaceInvaders.scoreIncrease
                }
            }
        }
    }
    
    /// Returns whether or not the `bullet` made contact with the `alien`.
    func madeContact(_ bullet: Bullet, with alien: Alien) -> Bool {
        var xInRange = false
        var yInRange = false
        if bullet.x < alien.x + Double(AlienSize) / 2,
           bullet.x > alien.x - Double(AlienSize) / 2 {
            xInRange = true
        }
        if bullet.y + Double(BulletSize.height) < alien.y + Double(AlienSize) / 2,
           bullet.y + Double(BulletSize.height) > alien.y - Double(AlienSize) / 2 {
            yInRange = true
        }
        return xInRange && yInRange
    }
}
