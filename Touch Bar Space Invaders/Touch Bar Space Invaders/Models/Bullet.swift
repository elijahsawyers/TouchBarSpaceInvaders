//
//  Bullet.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/7/21.
//

import Foundation

struct Bullet: Identifiable {
    /// How much to move the bullet by on each iteration of the game loop.
    static let stride: Double = -10.0
    
    /// Unique identifier.
    let id = UUID()
    
    /// Current x-position.
    var x: Double
    
    /// Current y-position.
    var y: Double
    
    /// Moves the bullet by `dy`.
    mutating func move(by dy: Double) {
        y += dy
    }
}
