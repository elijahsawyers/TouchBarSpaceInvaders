//
//  Spaceship.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import Foundation

struct Spaceship {
    /// Current x-position.
    var x: Double

    /// Current y-position.
    var y: Double
    
    /// Previous move dx.
    var previousMove: Double?
    
    /// Whether or not the spaceship is moving.
    var isMoving: Bool = false {
        didSet {
            if !isMoving {
                previousMove = nil
            }
        }
    }

    /// Bullets in gameplay.
    var bullets: [Bullet] = {
       return []
    }()
    
    /// How many interations it's been since the spaceship has shot a bullet.
    ///
    /// - Note: Only allowing spaceship to shoot every half-second.
    var timeOfLastBullet: Date?

    /// Whether or not enough time has passed for the spaceship to shoot.
    var canShootBullet: Bool {
        if let timeOfLastBullet = timeOfLastBullet {
            let timePassed = Date().timeIntervalSince(timeOfLastBullet)
            return timePassed >= 0.5
        }
        return true
    }
    
    /// Shoot a bullet - appends a new bullet to the bullets array.
    mutating func shoot() {
        if canShootBullet {
            bullets.append(Bullet(
                x: x,
                y: y - Double(SpaceshipHeight)
            ))
            timeOfLastBullet = Date()
        }
    }
    
    /// Moves the spaceship by `dx`.
    mutating func move(by dx: Double) {
        if let previousMove = previousMove {
            x += dx - previousMove
        } else {
            x += dx
        }
        previousMove = dx
    }
}
