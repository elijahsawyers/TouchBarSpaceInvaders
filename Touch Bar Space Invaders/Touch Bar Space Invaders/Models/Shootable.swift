//
//  Shootable.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/14/21.
//

import Foundation

protocol Shootable {
    var x: Double { get }
    
    var y: Double { get }
    
    var width: Double { get }
    
    var height: Double { get }
    
    mutating func isShot(by shooter: Shooter) -> Bullet?
}

extension Shootable {
    mutating func isShot(by shooter: Shooter) -> Bullet? {
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
