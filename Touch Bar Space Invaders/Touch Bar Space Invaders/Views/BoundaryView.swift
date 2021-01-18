//
//  BoundaryView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/17/21.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        return path
    }
}

struct BoundaryView: View {
    @State private var boundaryIsShowing = false

    var body: some View {
        VStack(spacing: 0.0) {
            if boundaryIsShowing {
                HStack {
                    Text(warningLabel)
                        .foregroundColor(color)
                        .padding(textPadding)
                    Spacer()
                }
                Line()
                    .stroke(style: strokeStyle)
                    .foregroundColor(color)
                    .frame(height: height)
            }
        }
        .position(x: GameWindowWidth / 2, y: GameWindowHeight - BoundaryOffset)
        .onAppear {
            withAnimation(.linear(duration: 0.25)) {
                boundaryIsShowing = true
            }
        }
    }
    
    // MARK: - Drawing Constant[s]
    
    private let warningLabel = "DANGER"
    private let textPadding: CGFloat = 5.0
    private let strokeStyle = StrokeStyle(lineWidth: 1, dash: [5])
    private let color: Color = .red
    private let height: CGFloat = 1.0
}
