//
//  Shooter.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/14/21.
//

import Foundation

/// Describes an object that can shoot bullets.
protocol Shooter {
    /// Defines the interval on which it takes the `Shooter` to reload.
    ///
    /// For example, if the interval is `1.0`, the shoot method will only add
    /// a new `bullet` to the `bullets` array if it's been greater than or
    /// equal to one second.
    var reloadTime: TimeInterval { get }
    
    /// Whether or not the `reloadTime` has passed so that the
    /// `Shooter` is able to shoot.
    var hasReloaded: Bool { get }
    
    /// When the last bullet was shot.
    var dateOfLastBullet: Date? { get set }
    
    /// How far the bullet moves when calling `updateBulletPositions`.
    var bulletVelocity: Double { get }
    
    /// Stores all bullets that have been shot.
    var bullets: [Bullet] { get set }
    
    /// Adds a new bullet to the bullets array.
    mutating func shoot(withBarrelAt x: Double, _ y: Double)
    
    /// Update each bullet's position by `bulletVelocity`.
    mutating func updateBulletPositions()
    
    /// Removes a bullet from the bullet array.
    mutating func bulletMadeContact(_ bullet: Bullet)
}

/// Default implementations for the `Shooter` protocol.
extension Shooter {
    var reloadTime: TimeInterval {
        1.0
    }
    
    var hasReloaded: Bool {
        if let dateOfLastBullet = dateOfLastBullet {
            let timePassed = Date().timeIntervalSince(dateOfLastBullet)
            return timePassed >= reloadTime
        }
        return true
    }
    
    mutating func shoot(withBarrelAt x: Double, _ y: Double) {
        if hasReloaded {
            bullets.append(Bullet(
                x: x,
                y: y
            ))
            dateOfLastBullet = Date()
        }
    }

    mutating func updateBulletPositions() {
        // Remove the first bullet if it's out of gameplay bounds.
        if let bullet = bullets.first,
           bullet.y < 0 - Double(BulletSize.height) ||
           bullet.y > Double(GameWindowHeight) + Double(BulletSize.height) {
            bullets.removeFirst()
        }
        
        // Otherwise, update each bullet's position.
        bullets.enumerated().forEach { index, _ in
            bullets[index].move(by: bulletVelocity)
        }
    }
    
    mutating func bulletMadeContact(_ bullet: Bullet) {
        bullets.removeAll { currentBullet in
            currentBullet == bullet
        }
    }
}
