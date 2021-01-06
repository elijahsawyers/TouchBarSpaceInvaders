//
//  StarryBackgroundView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import SwiftUI
import Combine

struct StarryBackgroundView: View {
    @State private var offset: CGFloat = 0.0
    @State private var starIsUpdatingPosition = [Bool](
        repeating: false,
        count: StarryBackgroundView.starCount
    )
    @State private var starPositions: [CGPoint] = {
        var starPositions = [CGPoint]()
        for _ in StarryBackgroundView.starRange {
            starPositions.append(CGPoint(
                x: CGFloat.random(in: 0...GameWindowWidth),
                y: CGFloat.random(in: 0...GameWindowHeight)
            ))
        }
        return starPositions
    }()
    var timer = Timer.publish(
        every: StarryBackgroundView.timerInterval,
        on: .main,
        in: .common
    ).autoconnect()

    var body: some View {
        ZStack {
            ForEach(StarryBackgroundView.starRange) { index in
                StarView()
                    .position(starPositions[index])
                    .offset(y: offset)
                    .animation(
                        starIsUpdatingPosition[index] ?
                            .none :
                            starAnimation
                    )
            }
        }
        .onReceive(timer, perform: { _ in
            starIsUpdatingPosition = [Bool](repeating: false, count: StarryBackgroundView.starCount)
            starPositions.enumerated().forEach { index, position in
                if position.y + offset > GameWindowHeight {
                    starIsUpdatingPosition[index] = true
                    starPositions[index] = CGPoint(
                        x: CGFloat.random(in: 0...GameWindowWidth),
                        y: 0.0 - offset
                    )
                }
            }
            offset += offsetStride
        })
    }
    
    // MARK: - Drawing Constant[s]

    private static let starCount: Int = 500
    private static let starRange: Range = 0..<StarryBackgroundView.starCount
    private static let timerInterval: Double = 0.25
    private let starAnimation: Animation = .linear(duration: 0.25)
    private let offsetStride: CGFloat = 1.0
}

struct StarView: View {
    @State private var frame: CGSize = CGSize(
        width: CGFloat.random(in: 0...3),
        height: CGFloat.random(in: 0...3)
    )
    @State private var opacity: Double = Double.random(in: 0.25...1.0)

    var body: some View {
        Circle()
            .opacity(opacity)
            .foregroundColor(starColor)
            .frame(width: frame.width, height: frame.height)
    }

    // MARK: - Drawing Constant[s]
    
    private let starColor: Color = .white
}
