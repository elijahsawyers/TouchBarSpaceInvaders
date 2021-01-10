//
//  SpaceInvaders.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import Foundation

struct SpaceInvaders {
    /// How much to increase score on alien death.
    static let scoreIncrease = 10
    
    /// Current score of the game.
    private(set) var score = 0
    
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
    
    /// Barricades in gameplay.
    private(set) var barricades: [Barricade] = {
       return []
    }()

    /// Aliens in gameplay.
    var aliens: [Alien] = Alien.buildAlienSpawn()

    /// Whether or not all aliens have been killed.
    var allAliensDead: Bool {
        for alien in aliens {
            if !alien.isDead {
                return false
            }
        }
        return true
    }
    
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
    
    /// How much the alien swarm has been offset.
    var swarmOffset: Double = 0.0

    /// Spaceship in gameplay.
    var spaceship: Spaceship = Spaceship(
        x: Double(GameWindowWidth/2),
        y: Double(GameWindowHeight - GameplayInformationHeight - SpaceshipHeight/2)
    )
    
    /// Runs the next iteration of  the game loop.
    mutating func loop() {
        gameInMotion = true
        
        // Update each bullet's position.
        if let bullet = spaceship.bullets.first, bullet.y < 0 - Double(BulletSize.height) {
            spaceship.bullets.removeFirst()
        }
        spaceship.bullets.enumerated().forEach { index, _ in
            spaceship.bullets[index].move(by: Bullet.stride)
        }
        if let bullet = Alien.bullets.first, bullet.y < 0 - Double(BulletSize.height) {
            Alien.bullets.removeFirst()
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
        swarmOffset += Alien.areMovingRight ? Alien.horizontalStride : -Alien.horizontalStride
        if swarmOffset == 50.0 {
            Alien.areMovingRight = false
            moveDown = true
        } else if swarmOffset == -50.0 {
            Alien.areMovingRight = true
            moveDown = true
        }
        aliens.enumerated().forEach { index, _ in
            if moveDown {
                aliens[index].move(y: Alien.verticalStride)
            }
            aliens[index].move(x: Alien.areMovingRight ? Alien.horizontalStride : -Alien.horizontalStride)
        }
        
        // Check if any of the spaceship bullets are touching an alien.
        spaceship.bullets.enumerated().forEach { bulletIndex, bullet in
            aliens.enumerated().forEach { alienIndex, alien in
                if !alien.isDead, madeContact(bullet, with: alien) {
                    spaceship.bullets.remove(at: bulletIndex)
                    aliens[alienIndex].isDead = true
                    score += SpaceInvaders.scoreIncrease
                }
            }
        }
        
        // Check if any of the alien bullets are touching the ship.
        Alien.bullets.enumerated().forEach { bulletIndex, bullet in
            if madeContact(bullet, with: spaceship) {
                Alien.bullets.remove(at: bulletIndex)
                if spaceship.heartsRemaining > 0 {
                    spaceship.heartsRemaining -= 1
                } else {
                    gameOver = true
                }
            }
        }
        
        // Respawn the aliens, if needed.
        if allAliensDead {
            swarmOffset = 0.0
            aliens = Alien.buildAlienSpawn()
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

    /// Returns whether or not the `bullet` made contact with the `spaceship`.
    func madeContact(_ bullet: Bullet, with spaceship: Spaceship) -> Bool {
        var xInRange = false
        var yInRange = false
        if bullet.x < spaceship.x + Double(SpaceshipWidth) / 2,
           bullet.x > spaceship.x - Double(SpaceshipWidth) / 2 {
            xInRange = true
        }
        if bullet.y - Double(BulletSize.height) < spaceship.y + Double(SpaceshipHeight) / 2,
           bullet.y - Double(BulletSize.height) > spaceship.y - Double(SpaceshipHeight) / 2 {
            yInRange = true
        }
        return xInRange && yInRange
    }
}
