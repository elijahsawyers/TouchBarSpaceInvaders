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
            Rectangle()
                .frame(height: GameplayInformationHeight)
                .position(x: GameWindowWidth / 2, y: GameWindowHeight - GameplayInformationHeight/2)
                .foregroundColor(.black)
            Rectangle()
                .frame(height: 1)
                .position(x: GameWindowWidth / 2, y: GameWindowHeight - GameplayInformationHeight)
            HStack(spacing: 10) {
                Heart()
                    .frame(width: 25, height: 25)
                Heart()
                    .frame(width: 25, height: 25)
                Heart()
                    .frame(width: 25, height: 25)
            }
            .position(x: 55, y: GameWindowHeight - GameplayInformationHeight / 2)
        }
    }
}
