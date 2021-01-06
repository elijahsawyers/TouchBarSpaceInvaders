//
//  SpaceshipView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import SwiftUI

struct SpaceshipView: View {
    // MARK: - Type Properties
    
    static let height: CGFloat = 30
    static let width: CGFloat = 75
    static let startingPosition = CGPoint(
        x: GameWindowWidth/2,
        y: GameWindowHeight - GameplayInformationHeight - SpaceshipView.height/2
    )
    
    // MARK: - Space Ship Structure

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
    
    // MARK: - View Body

    var body: some View {
        ZStack {
            ZStack {
                Rectangle()
                    .frame(width: TouchBarWidth, height: TouchBarHeight)
                    .foregroundColor(.clear)
                Structure()
                    .offset(x: offset)
                    .gesture(shipDragGesture)
            }
                .displayedInTouchBar()
            Structure()
                .offset(x: offset)
                .position(SpaceshipView.startingPosition)
        }
        .onExitCommand(perform: {
            // Handle shooting.
        })
    }
    
    // MARK: - Gesture[s]
    
    @State var steadyStateOffset: CGFloat = 0.0
    @GestureState private var gestureStateOffset: CGFloat = 0.0
    private var offset: CGFloat {
        steadyStateOffset + gestureStateOffset
    }
    private var shipDragGesture: some Gesture {
        DragGesture()
            .updating($gestureStateOffset) { currentState, gestureState, _ in
                gestureState = currentState.translation.width
            }
            .onEnded { finalGestureState in
                steadyStateOffset += finalGestureState.translation.width
            }
    }
}
