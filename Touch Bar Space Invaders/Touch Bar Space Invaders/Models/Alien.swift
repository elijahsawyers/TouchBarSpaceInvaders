//
//  Alien.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import Foundation

struct Alien: Identifiable {
    /// How many aliens the game starts with.
    static let alienCount = 15

    /// How much to move the alien by (horizontally) on each iteration of the game loop.
    static let horizontalStride: Double = 1.0
    
    /// How much to move the alien by (vertically) on each iteration of the game loop.
    static let verticalStride: Double = 10.0
    
    /// Whether or not the aliens are moving to the right.
    static var areMovingRight: Bool = true

    /// How many interations it's been since an alien has shot a bullet.
    ///
    /// - Note: Only allowing aliens to shoot every second.
    static var timeOfLastBullet: Date? = Date().advanced(by: TimeInterval(0.25))

    /// Whether or not enough time has passed for an alien to shoot.
    static var canShootBullet: Bool {
        if let timeOfLastBullet = timeOfLastBullet {
            let timePassed = Date().timeIntervalSince(timeOfLastBullet)
            return timePassed >= 1.0
        }
        return true
    }
    
    /// Array of bullets shot by aliens.
    static var bullets: [Bullet] = []
    
    /// Builds a spawn of aliens.
    static func buildAlienSpawn() -> [Alien] {
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
        
        return aliens
    }

    /// Unique identifier.
    let id = UUID()

    /// Current x-position.
    var x: Double
    
    /// Current y-position.
    var y: Double
    
    /// Whether or not the alien has been killed.
    var isDead: Bool = false
    
    /// Moves the alien by `dx` and `dy`.
    mutating func move(x dx: Double? = nil, y dy: Double? = nil) {
        x += dx ?? 0.0
        y += dy ?? 0.0
    }
}
