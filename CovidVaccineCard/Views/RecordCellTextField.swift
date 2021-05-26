//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

/// A standard text field for cells
struct RecordCellTextField: View {
    
    @EnvironmentObject var recordVM: RecordViewModel
    
    let label: String
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        HStack {
            Text(label).font(.body)
            Spacer()
            TextField(placeholder,
                text: $text,
                onEditingChanged: { _ in  },
                onCommit: { recordVM.save() }
            )
            .font(.body)
            .multilineTextAlignment(.trailing)
            .disableAutocorrection(true)
        }
    }
    
}
