//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

struct RecordInfoCell: View {
    
    @EnvironmentObject var recordVM: RecordViewModel
    
    var body: some View {
        VStack {
            RecordCellHeader(
                image: "heart.text.square.fill",
                color: Color.purple,
                label: "Patient Info"
            )
            Divider()
            VStack(spacing: 10) {
                RecordCellTextField(
                    label: "Name:",
                    placeholder: "name",
                    text: $recordVM.record.name
                )
                RecordCellTextField(
                    label: "Patient Number:",
                    placeholder: "number",
                    text: $recordVM.record.patientID
                )
                RecordCellDateField(
                    label: "Date of Birth:",
                    date: $recordVM.record.birthDate
                )
            }
        }
        .padding()
        .background(RecordCellBackground())
    }
    
}
