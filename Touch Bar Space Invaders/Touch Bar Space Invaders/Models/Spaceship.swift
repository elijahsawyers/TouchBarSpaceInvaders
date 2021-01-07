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
    
    /// Shoot a bullet - appends a new bullet to the bullets array.
    mutating func shoot() {
        bullets.append(Bullet(
            x: x,
            y: y - Double(SpaceshipHeight)
        ))
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
