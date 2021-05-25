//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

struct RecordCellHeader: View {
    
    let image: String
    let color: Color
    let label: String
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .resizable().scaledToFit().frame(width: 18, height: 18)
                .foregroundColor(color)
            Text(label)
                .font(.headline)
            Spacer()
        }
    }
    
}
