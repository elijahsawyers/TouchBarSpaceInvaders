//
//  Spaceship.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import Foundation

struct Spaceship: Shooter, Shootable {
    /// Returns a `Spaceship` at its start position.
    static var atStartPosition: Spaceship {
        Spaceship(
            x: Double(GameWindowWidth/2),
            y: Double(GameWindowHeight - GameplayInformationHeight - SpaceshipHeight/2)
        )
    }

    /// How fast the bullet moves.
    let bulletVelocity: Double = -10.0
    
    /// How fast the spaceship can reload.
    var reloadTime: TimeInterval = 0.5
    
    /// When the last bullet was fired.
    var dateOfLastBullet: Date?
    
    /// Bullets in gameplay.
    var bullets: [Bullet] = []
    
    /// Current x-position.
    var x: Double

    /// Current y-position.
    var y: Double
    
    /// The width of the spaceship.
    var width = Double(SpaceshipWidth)
    
    /// The height of the spaceship.
    var height = Double(SpaceshipHeight)
    
    /// Whether or not the spaceship is dead (all hearts used).
    var isDead: Bool {
        get {
            heartsRemaining != 0
        }
        set {
            if newValue {
                isDead = false
            }
        }
    }

    /// Amount of lives (a.k.a. hearts) remaining.
    ///
    /// - Note: The game starts out with three lives.
    var heartsRemaining = 3
    
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
