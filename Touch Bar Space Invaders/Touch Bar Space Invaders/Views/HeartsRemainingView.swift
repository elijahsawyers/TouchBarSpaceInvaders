//
//  HeartsRemainingView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/7/21.
//

import SwiftUI

struct HeartsRemainingView: View {
    @EnvironmentObject private var game: TouchBarSpaceInvaders

    var body: some View {
        HStack(spacing: heartSpacing) {
            ForEach(0..<game.heartsRemaining, id: \.self) { _ in
                HeartView()
                    .frame(width: heartSize, height: heartSize)
            }
        }
            .padding(.horizontal)
    }
    
    // MARK: - Drawing Constant[s]
    
    private let heartSize: CGFloat = 25.0
    private let heartSpacing: CGFloat = 10.0
}
