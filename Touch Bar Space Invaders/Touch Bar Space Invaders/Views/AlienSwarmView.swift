//
//  AlienSwarmView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/6/21.
//

import SwiftUI
import Combine

struct AlienSwarmView: View {
    @State var alienArmsDown: Bool = true

    var body: some View {
        VStack(spacing: alienRowSpacing) {
            ForEach(0..<alienRowCount) { i in
                HStack(spacing: alienColumnSpacing) {
                    ForEach(0..<alienColumnCount) { j in
                        AlienView(armsDown: alienArmsDown)
                    }
                }
            }
        }
        .position(
            x: GameWindowWidth / 2,
            y: 0 + ((CGFloat(alienRowCount) * AlienSize) + (CGFloat(alienRowCount) * alienRowSpacing)) / 2
        )
    }

    // MARK: - Drawing Constant[s]

    private let alienRowCount: Int = 5
    private let alienColumnCount: Int = 8
    private let alienRowSpacing: CGFloat = 10
    private let alienColumnSpacing: CGFloat = 15
}
