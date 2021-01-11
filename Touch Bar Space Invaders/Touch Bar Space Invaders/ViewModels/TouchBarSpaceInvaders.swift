//
//  TouchBarSpaceInvaders.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/7/21.
//

import SwiftUI
import Combine

class TouchBarSpaceInvaders: ObservableObject {
    static let highScoreUserDefaultsKey = "TouchBarSpaceInvaders.HighScore"
    @Published var game = SpaceInvaders()
    var highScore: Int
    let gameTimerInterval: Double = 0.025
    var gameTimer: Timer?

    // MARK: - Initializer[s]

    init() {
        highScore = Int(UserDefaults.standard.double(forKey: TouchBarSpaceInvaders.highScoreUserDefaultsKey))
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
    
    func updateHighScore(to score: Int) {
        if score > highScore {
            UserDefaults.standard.setValue(score, forKey: TouchBarSpaceInvaders.highScoreUserDefaultsKey)
        }
    }

    // MARK: - Model Accessor[s]
    
    var score: Int {
        game.score
    }
    
    var gameOver: Bool {
        game.gameOver
    }
    
    var gameInMotion: Bool {
        game.gameInMotion
    }
    
    var gameCreated: Bool {
        game.gameCreated
    }
    
    var heartsRemaining: Int {
        game.spaceship.heartsRemaining
    }
    
    var level: Int {
        game.level
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
