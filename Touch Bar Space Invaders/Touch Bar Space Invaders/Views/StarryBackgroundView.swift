//
//  StarryBackgroundView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import SwiftUI
import Combine

struct StarryBackgroundView: View {
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

    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(backgroundColor)
            ForEach(StarryBackgroundView.starRange) { index in
                StarView()
                    .position(starPositions[index])
            }
        }
    }
    
    // MARK: - Drawing Constant[s]

    private static let starCount: Int = 500
    private static let starRange: Range = 0..<StarryBackgroundView.starCount
    private let backgroundColor: Color = .black
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
