//
//  BarricadesRowView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/17/21.
//

import SwiftUI

struct BarricadesRowView: View {
    @EnvironmentObject private var game: TouchBarSpaceInvaders
    @State private var barricadesAreShowing = false

    var body: some View {
        ZStack {
            ForEach(game.barricades) { barricade in
                if barricade.isFunctioning && barricadesAreShowing {
                    BarricadeView(hitsRemaining: barricade.hitsRemaining)
                        .position(x: CGFloat(barricade.x), y: CGFloat(barricade.y))
                        .transition(.opacity)
                }
            }
        }
        .onAppear {
            withAnimation(.linear(duration: 0.25)) {
                barricadesAreShowing = true
            }
        }
    }
}
