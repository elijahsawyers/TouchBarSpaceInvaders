//
//  Alien.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import Foundation

struct Alien: Identifiable, Shootable {
    /// Unique identifier.
    let id = UUID()

    /// Current x-position.
    var x: Double
    
    /// Current y-position.
    var y: Double
    
    /// Width of the alien.
    let width = Double(AlienSize)
    
    /// Height of the alien.
    let height = Double(AlienSize)
    
    /// Whether or not the alien has been killed.
    var isDead: Bool = false
    
    /// Moves the alien by `dx` and `dy`.
    mutating func move(x dx: Double? = nil, y dy: Double? = nil) {
        x += dx ?? 0.0
        y += dy ?? 0.0
    }
}
