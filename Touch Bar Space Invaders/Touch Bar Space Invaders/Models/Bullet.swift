//
//  Bullet.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/7/21.
//

import Foundation

struct Bullet: Identifiable, Equatable {
    /// Conformance to the `Equatable` protocol.
    static func ==(_ lhs: Bullet, _ rhs: Bullet) -> Bool {
        lhs.id == rhs.id
    }
    
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
