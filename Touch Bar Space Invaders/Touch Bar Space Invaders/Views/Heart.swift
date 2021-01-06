//
//  Heart.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/6/21.
//

import SwiftUI

struct Heart: View {
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Circle()
                    .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                    .offset(x: -geometry.size.width/5, y: -geometry.size.height/5)
                    .offset(x: geometry.size.width/4, y: geometry.size.height/3)
                Circle()
                    .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                    .offset(x: geometry.size.width/5, y: -geometry.size.height/5)
                    .offset(x: geometry.size.width/4, y: geometry.size.height/3)
                Rectangle()
                    .rotation(Angle.degrees(45))
                    .frame(width: geometry.size.width/2, height: geometry.size.height/2)
                    .offset(x: geometry.size.width/4, y: geometry.size.height/3)
            }
        }
        .foregroundColor(.red)
    }
}
