//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

extension Color {
    
    static var background: Color {
        Color(UIColor.secondarySystemBackground)
    }
    
}

extension View {
    
    func paletteShadow() -> some View {
        return self.modifier(ShadowModifier())
    }
    
}

extension Shape {
    
    func paletteBackground() -> some View {
        self.modifier(BackgroundFillModifier(shape: self))
    }
    
}

struct ShadowModifier: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    func body(content: Content) -> some View {
        if colorScheme == .light {
            content.shadow(
                color: Color.gray.opacity(0.3),
                radius: 10
            )
        } else {
            content
        }
    }
    
}

struct BackgroundFillModifier<MyShape: Shape>: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    let shape: MyShape
    
    func body(content: Content) -> some View {
        return shape.fill(colorScheme == .light ? Color.white : Color.background)
    }
    
}
