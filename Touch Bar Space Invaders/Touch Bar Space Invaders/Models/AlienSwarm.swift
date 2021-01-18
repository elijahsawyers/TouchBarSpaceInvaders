//
//  AlienSwarm.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/15/21.
//

import Foundation

struct AlienSwarm: Shooter {
    /// How fast the bullet moves.
    let bulletVelocity: Double = 5.0
    
    /// When the last bullet was fired.
    var dateOfLastBullet: Date?
    
    /// How fast the swarm can shoot.
    var reloadTime: TimeInterval = 0.5
    
    /// Bullets in gameplay.
    var bullets: [Bullet] = []

    /// How many aliens the game starts with.
    let alienCount = 15

    /// How much to move the alien by (horizontally) on each iteration of the game loop.
    let horizontalStride: Double = 1.0
    
    /// How much to move the alien by (vertically) on each iteration of the game loop.
    let verticalStride: Double = 10.0
    
    /// Whether or not the swarm is moving to the right.
    var movingRight: Bool = true
    
    /// How much the alien swarm has been offset horizontally.
    var horizontalOffset: Double = 0.0
    
    /// Aliens in the swarm.
    var aliens: [Alien] = []
    
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
        
        columnLoop: for i in [10, 11, 12, 13, 14] {
            for j in 0..<3 {
                if !aliens[i - (5 * j)].isDead {
                    indicesOfAliensInFront.append(i - (5 * j))
                    continue columnLoop
                }
            }
        }
        
        return indicesOfAliensInFront
    }
    
    /// Builds a spawn of aliens.
    init() {
        var aliens = [Alien]()
        let horizontalAlienSpacing: Double = 75.0
        let verticalAlienSpacing: Double = 25.0
        let offsetX = (Double(GameWindowWidth) - (4 * Double(AlienSize)) - (4 * horizontalAlienSpacing)) / 2.0
        let offsetY = Double(AlienSize) / 2.0

        for i in 0..<3 {
            for j in 0..<5 {
                aliens.append(Alien(
                    x: (Double(AlienSize) + horizontalAlienSpacing) * Double(j) + offsetX,
                    y: (Double(AlienSize) + verticalAlienSpacing) * Double(i) + offsetY
                ))
            }
        }
        
        self.aliens = aliens
    }
    
    /// Moves each alien in the swarm by `dx` and `dy`.
    mutating func move(x dx: Double? = nil, y dy: Double? = nil) {
        var moveDown = false
        horizontalOffset += movingRight ? horizontalStride : -horizontalStride
        if horizontalOffset == 50.0 {
            movingRight = false
            moveDown = true
        } else if horizontalOffset == -50.0 {
            movingRight = true
            moveDown = true
        }
        aliens.enumerated().forEach { index, _ in
            if moveDown {
                aliens[index].move(y: verticalStride)
            }
            aliens[index].move(x: movingRight ? horizontalStride : -horizontalStride)
        }
    }
    
    /// Shoots a bullet from a random alien in front.
    mutating func shoot() {
        if let indexOfAlienToShoot = indicesOfAliensInFront.randomElement() {
            shoot(withBarrelAt:
                aliens[indexOfAlienToShoot].x,
                aliens[indexOfAlienToShoot].y + Double(AlienSize)
            )
        }
    }
    
    /// Returns the `shooter` `bullets` that hit an alien.
    mutating func bulletsHittingAnAlien(by shooter: Shooter) -> [Bullet]? {
        var bullets = [Bullet]()
        for index in aliens.indices {
            if !aliens[index].isDead {
                if let bullet = aliens[index].isShot(by: shooter) {
                    aliens[index].isDead = true
                    bullets.append(bullet)
                }
            }
        }
        return bullets.isEmpty ? nil : bullets
    }
}
