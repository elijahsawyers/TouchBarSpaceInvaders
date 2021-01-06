//
//  StarryBackgroundView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import SwiftUI

struct StarryBackgroundView: View {
    static let starCount = 1000

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(0..<StarryBackgroundView.starCount) { _ in
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: CGFloat.random(in: 0...3), height: CGFloat.random(in: 0...3))
                        .position(x: CGFloat.random(in: 0...geometry.size.width), y: CGFloat.random(in: 0...geometry.size.height))
                        .opacity(Double.random(in: 0.25...1.0))
                }
            }
        }
    }
}
