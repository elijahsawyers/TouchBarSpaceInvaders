//
//  Barricade.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import Foundation

struct Barricade: Identifiable, Shootable {
    /// Returns a row of 3 barricades in their standard position.
    static let row: [Barricade] = {
        var barricades = [Barricade]()
        barricades.append(Barricade(
            x: Double(GameWindowWidth) / 6,
            y: Double(GameWindowHeight) - Double(BarricadeOffset)
        ))
        barricades.append(Barricade(
            x: Double(GameWindowWidth) / 2,
            y: Double(GameWindowHeight) - Double(BarricadeOffset)
        ))
        barricades.append(Barricade(
            x: 5 * Double(GameWindowWidth) / 6,
            y: Double(GameWindowHeight) - Double(BarricadeOffset)
        ))
        return barricades
    }()

    /// Unique identifier.
    let id = UUID()
    
    /// Current x-position.
    var x: Double
    
    /// Current y-position.
    var y: Double

    /// Width of the barricade.
    var width = Double(BarricadeWidth)
    
    /// Height of the barricade.
    var height = Double(BarricadeHeight)
    
    /// The number of bullet hits it has remaining.
    var hitsRemaining: Int = 100
    
    /// Whether or not the barricade has been destroyed by bullets.
    var isFunctioning: Bool {
        hitsRemaining > 0
    }
}
