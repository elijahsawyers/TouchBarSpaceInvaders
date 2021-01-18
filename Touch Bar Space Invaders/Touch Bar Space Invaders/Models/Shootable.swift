//
//  Shootable.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/14/21.
//

import Foundation

protocol Shootable {
    /// Current x-position of the `Shootable` object.
    var x: Double { get }
    
    /// Current y-position of the `Shootable` object.
    var y: Double { get }
    
    /// Width of the `Shootable` object.
    var width: Double { get }
    
    /// Height of the `Shootable` object.
    var height: Double { get }
    
    /// Whether or not the `Shootable` object has been shot by the `shooter`.
    func isShot(by shooter: Shooter) -> Bullet?
}

extension Shootable {
    func isShot(by shooter: Shooter) -> Bullet? {
        for bullet in shooter.bullets {
            var xInRange = false
            var yInRange = false
            
            if bullet.x < x + width / 2,
               bullet.x > x - width / 2 {
                xInRange = true
            }
            
            if bullet.y < y + height / 2,
               bullet.y > y - height / 2 {
                yInRange = true
            }
            
            if xInRange && yInRange {
                return bullet
            }
        }
        return nil
    }
}
