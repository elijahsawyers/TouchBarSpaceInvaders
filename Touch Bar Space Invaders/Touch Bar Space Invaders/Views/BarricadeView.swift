//
//  BarricadeView.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/15/21.
//

import SwiftUI

struct BarricadeView: View {
    var body: some View {
        VStack(spacing: 0.0) {
            HStack(spacing: 0.0) {
                Spacer()
                Rectangle().frame(width: 20)
                Spacer()
            }.frame(height: 5)
            HStack(spacing: 0.0) {
                Spacer()
                Rectangle().frame(width: 40)
                Spacer()
            }.frame(height: 5)
            HStack(spacing: 0.0) {
                Spacer()
                Rectangle().frame(width: 60)
                Spacer()
            }.frame(height: 5)
            HStack(spacing: 0.0) {
                Spacer()
                Rectangle().frame(width: 80)
                Spacer()
            }.frame(height: 5)
            Rectangle().frame(width: 80, height: 25)
            HStack(spacing: 0.0) {
                Rectangle().frame(width: 30)
                Spacer()
                Rectangle().frame(width: 30)
            }.frame(height: 5)
            HStack(spacing: 0.0) {
                Rectangle().frame(width: 20)
                Spacer()
                Rectangle().frame(width: 20)
            }.frame(height: 5)
            HStack(spacing: 0.0) {
                Rectangle().frame(width: 10)
                Spacer()
                Rectangle().frame(width: 10)
            }.frame(height: 10)
        }
        .foregroundColor(.green)
        .frame(width: 80)
    }
}

struct BarricadeView_Previews: PreviewProvider {
    static var previews: some View {
        BarricadeView()
    }
}
