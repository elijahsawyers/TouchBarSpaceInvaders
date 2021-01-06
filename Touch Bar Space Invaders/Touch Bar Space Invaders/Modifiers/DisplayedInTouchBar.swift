//
//  DisplayedInTouchBar.swift
//  Touch Bar Space Invaders (macOS)
//
//  Created by Elijah Sawyers on 1/5/21.
//

import SwiftUI

struct DisplayedInTouchBar: ViewModifier {
    func body(content: Content) -> some View {
        FocusView()
            .frame(width: .zero, height: .zero)
            .touchBar {
                content
            }
    }
}

extension View {
    func displayedInTouchBar() -> some View {
        self.modifier(DisplayedInTouchBar())
    }
}

/*
 MARK: - Hacky solution to get the view to take focus and make Touch Bar items show up.
*/
class FocusNSView: NSView {
    override var acceptsFirstResponder: Bool {
        return true
    }
}

struct FocusView: NSViewRepresentable {
    func makeNSView(context: NSViewRepresentableContext<FocusView>) -> FocusNSView {
        return FocusNSView()
    }

    func updateNSView(_ nsView: FocusNSView, context: Context) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
            if let window = nsView.window {
                if let _ = window.firstResponder as? NSWindow {
                    window.makeFirstResponder(nsView)
                }
            }
        }
    }
}
