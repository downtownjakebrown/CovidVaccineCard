//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

/// A standard background for cells
struct RecordCellBackground: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .paletteBackground()
            .paletteShadow()
    }
    
}
