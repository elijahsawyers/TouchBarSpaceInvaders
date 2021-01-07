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
            .frame(width: BulletSize.width, height: BulletSize.height)
    }
    
    // MARK: - Drawing Constant[s]

    private let bulletColor: Color = .red
}
