//
//  AlienView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/6/21.
//

import SwiftUI

struct AlienView: View {
    var armsDown: Bool

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer().frame(width: 10)
                Rectangle().frame(width: 5, height: 5)
                Spacer().frame(width: 20)
                Rectangle().frame(width: 5, height: 5)
                Spacer().frame(width: 10)
            }
            if (armsDown) {
                HStack {
                    Spacer().frame(width: 15)
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 10)
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 15)
                }
            } else {
                HStack {
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 10)
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 10)
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 10)
                    Rectangle().frame(width: 5, height: 5)
                }
            }
            if (armsDown) {
                HStack {
                    Spacer().frame(width: 10)
                    Rectangle().frame(width: 30, height: 5)
                    Spacer().frame(width: 10)
                }
            } else {
                HStack {
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 30, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 5, height: 5)
                }
            }
            if (armsDown) {
                HStack {
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 10, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 10, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 10, height: 5)
                    Spacer().frame(width: 5)
                }
            } else {
                HStack {
                    Rectangle().frame(width: 15, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 10, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 15, height: 5)
                }
            }
            Rectangle().frame(width: 50, height: 5)
            if (armsDown) {
                HStack {
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 30, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 5, height: 5)
                }
            } else {
                HStack {
                    Spacer().frame(width: 10)
                    Rectangle().frame(width: 30, height: 5)
                    Spacer().frame(width: 10)
                }
            }
            if (armsDown) {
                HStack {
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 20)
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 5, height: 5)
                }
            } else {
                HStack {
                    Spacer().frame(width: 15)
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 10)
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 15)
                }
            }
            if (armsDown) {
                HStack {
                    Spacer().frame(width: 15)
                    Rectangle().frame(width: 10, height: 5)
                    Spacer().frame(width: 5)
                    Rectangle().frame(width: 10, height: 5)
                    Spacer().frame(width: 15)
                }
            } else {
                HStack {
                    Spacer().frame(width: 10)
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 20)
                    Rectangle().frame(width: 5, height: 5)
                    Spacer().frame(width: 10)
                }
            }
        }
        .foregroundColor(color)
        .frame(width: AlienSize, height: AlienSize)
    }
    
    // MARK: - Drawing Constant[s]
    
    private let color: Color = .purple
}
