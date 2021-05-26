//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

/// A cell for displaying thumbnails of the card images
struct RecordImageCell: View {
    
    var body: some View {
        VStack {
            RecordCellHeader(
                image: "staroflife.circle.fill",
                color: Color.green,
                label: "Card Photos"
            )
            Divider()
            HStack {
                RecordImageCellBlock(cardSide: .front)
                RecordImageCellBlock(cardSide: .back)
            }.padding(.top, 6)
        }
        .padding()
        .background(RecordCellBackground())
    }
    
}
