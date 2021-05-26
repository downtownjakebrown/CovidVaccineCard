//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

extension Color {
    
    /// A standard background color for our app
    static var background: Color {
        Color(UIColor.secondarySystemBackground)
    }
    
}

extension View {
    
    /// A standard shadow modifier for our app
    /// - Returns: A view with added shadow
    func paletteShadow() -> some View {
        return self.modifier(ShadowModifier())
    }
    
}

extension Shape {
    
    /// A standard background fill modifier for our app
    /// - Returns: A view with added background fill
    func paletteBackground() -> some View {
        self.modifier(BackgroundFillModifier(shape: self))
    }
    
}

/// A standard shadow modifier for our app
fileprivate struct ShadowModifier: ViewModifier {
    
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

/// A standard background fill modifier for our app
fileprivate struct BackgroundFillModifier<MyShape: Shape>: ViewModifier {
    
    @Environment(\.colorScheme) var colorScheme
    
    let shape: MyShape
    
    func body(content: Content) -> some View {
        return shape.fill(colorScheme == .light ? Color.white : Color.background)
    }
    
}
