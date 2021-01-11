//
//  SpaceshipView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import SwiftUI

struct SpaceshipView: View {
    @EnvironmentObject private var game: TouchBarSpaceInvaders
    @State var steadyStateOffset: CGFloat = 0.0
    @GestureState private var gestureStateOffset: CGFloat = 0.0
    private var offset: CGFloat {
        steadyStateOffset + gestureStateOffset
    }

    struct Structure: View {
        var body: some View {
            VStack(spacing: .zero) {
                Rectangle()
                    .frame(width: 4.5,height: 5)
                Rectangle()
                    .frame(width: 18,height: 7)
                Rectangle()
                    .frame(width: 60,height: 3)
                Rectangle()
                    .frame(width: 75,height: 15)
            }
            .foregroundColor(.green)
        }
    }
    
    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .frame(width: TouchBarWidth, height: TouchBarHeight)
                    .foregroundColor(.clear)
                Structure()
                    .offset(x: offset)
                    .gesture(shipDragGesture)
                    .animation(spaceshipAnimation)
            }
                .displayedInTouchBar()
            Structure()
                .position(game.spaceshipPosition)
                .animation(spaceshipAnimation)
        }
        .onExitCommand(perform: {
            if game.gameInMotion {
                game.shoot()
            }
        })
    }

    // MARK: - Gesture[s]

    private var shipDragGesture: some Gesture {
        DragGesture()
            .updating($gestureStateOffset) { currentState, gestureState, _ in
                game.spaceshipIsMoving = true
                game.moveSpaceship(by: currentState.translation.width)
                gestureState = currentState.translation.width
            }
            .onEnded { finalGestureState in
                game.moveSpaceship(by: finalGestureState.translation.width)
                steadyStateOffset += finalGestureState.translation.width
                game.spaceshipIsMoving = false
            }
    }
    
    // MARK: - Drawing Constant[s]
    
    private let spaceshipAnimation: Animation = .linear(duration: 0.10)
}
