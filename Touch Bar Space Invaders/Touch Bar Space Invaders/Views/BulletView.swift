//
//  BulletView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/7/21.
//

import SwiftUI

struct BulletView: View {
    var body: some View {
        Capsule()
            .foregroundColor(bulletColor)
            .frame(width: bulletSize.width, height: bulletSize.height)
    }
    
    // MARK: - Drawing Constant[s]
    
    private let bulletSize: CGSize = CGSize(width: 5, height: 25)
    private let bulletColor: Color = .red
}
