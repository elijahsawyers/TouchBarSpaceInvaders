//
//  GameplayInformationView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/6/21.
//

import SwiftUI

struct GameplayInformationView: View {
    var body: some View {
        ZStack {
            // Black background.
            Rectangle()
                .frame(height: GameplayInformationHeight)
                .position(x: GameWindowWidth / 2, y: GameWindowHeight - GameplayInformationHeight/2)
                .foregroundColor(.black)
            
            // White dividing line.
            Rectangle()
                .frame(height: 1)
                .position(x: GameWindowWidth / 2, y: GameWindowHeight - GameplayInformationHeight)
            
            // Gamplay information.
            HStack {
                // Hearts remaining.
                HStack(spacing: 10) {
                    HeartView()
                        .frame(width: 25, height: 25)
                    HeartView()
                        .frame(width: 25, height: 25)
                    HeartView()
                        .frame(width: 25, height: 25)
                }
                    .padding(.horizontal)

                Spacer()
                
                // Current score.
                Text("SCORE: 0")
                    .padding(.horizontal)
                    .font(.system(size: 24, design: .monospaced))
            }
            .position(x: GameWindowWidth / 2, y: GameWindowHeight - GameplayInformationHeight / 2)
        }
    }
}
