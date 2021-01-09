//
//  TouchBarSpaceInvaders.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/7/21.
//

import SwiftUI
import Combine

class TouchBarSpaceInvaders: ObservableObject {
    @Published var game: SpaceInvaders
    var gameTimer: Timer?
    let gameTimerInterval: Double = 0.025

    // MARK: - Initializer[s]
    
    init(game: SpaceInvaders) {
        self.game = game
    }

    convenience init() {
        self.init(game: SpaceInvaders())
        gameTimer = Timer.scheduledTimer(withTimeInterval: gameTimerInterval, repeats: true) { _ in
            self.game.loop()
        }
    }
    
    // MARK: - Intent[s]
    
    func shoot() {
        game.spaceship.shoot()
    }
    
    func moveSpaceship(by dx: CGFloat) {
        game.spaceship.move(by: Double(dx))
    }
    
    func newGame() {
        gameTimer?.invalidate()
        game = SpaceInvaders()
        gameTimer = Timer.scheduledTimer(withTimeInterval: gameTimerInterval, repeats: true) { _ in
            self.game.loop()
        }
    }

    // MARK: - Model Accessor[s]
    
    var score: Int {
        game.score
    }
    
    var gameOver: Bool {
        game.gameOver
    }
    
    var heartsRemaining: Int {
        game.spaceship.heartsRemaining
    }
    
    var spaceshipBullets: [Bullet] {
        game.spaceship.bullets
    }
    
    var spaceshipPosition: CGPoint {
        CGPoint(x: CGFloat(game.spaceship.x), y: CGFloat(game.spaceship.y))
    }
    
    var spaceshipIsMoving: Bool {
        get {
            game.spaceship.isMoving
        }
        set {
            game.spaceship.isMoving = newValue
        }
    }
    
    var aliens: [Alien] {
        game.aliens
    }
    
    var alienBullets: [Bullet] {
        Alien.bullets
    }
}
