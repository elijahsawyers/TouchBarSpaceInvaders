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
    
    /// Indices of the aliens in the front.
    var indicesOfAliensInFront: [Int] {
        var indicesOfAliensInFront = [Int]()
        
        columnLoop: for i in [20, 21, 22, 23, 24] {
            for j in 0..<5 {
                if !aliens[i - (5 * j)].isDead {
                    indicesOfAliensInFront.append(i - (5 * j))
                    continue columnLoop
                }
            }
        }
        
        return indicesOfAliensInFront
    }

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
        Alien.bullets.enumerated().forEach { index, _ in
            Alien.bullets[index].move(by: -Bullet.stride)
        }

        // Shoot from aliens.
        if Alien.canShootBullet {
            if let indexOfRandomAlienInFront = indicesOfAliensInFront.randomElement() {
                Alien.bullets.append(Bullet(
                    x: aliens[indexOfRandomAlienInFront].x,
                    y: aliens[indexOfRandomAlienInFront].y + Double(AlienSize)
                ))
                Alien.timeOfLastBullet = Date()
            }
        }
        
        // Update each aliens's position.
        var moveDown = false
        Alien.swarmOffset += Alien.areMovingRight ? Alien.horizontalStride : -Alien.horizontalStride
        if Alien.swarmOffset == 50.0 {
            Alien.areMovingRight = false
            moveDown = true
        } else if Alien.swarmOffset == -50.0 {
            Alien.areMovingRight = true
            moveDown = true
        }
        aliens.enumerated().forEach { index, _ in
            if moveDown {
                aliens[index].move(y: Alien.verticalStride)
            }
            aliens[index].move(x: Alien.areMovingRight ? Alien.horizontalStride : -Alien.horizontalStride)
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
        
        // TODO: Check if any of the alien bullets are touching the ship.
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
