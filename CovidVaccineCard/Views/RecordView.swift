//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

struct RecordView: View {
    
    @EnvironmentObject var recordVM: RecordViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    RecordImageCell()
                    RecordInfoCell()
                    ForEach(recordVM.record.doses, id: \.id) { dose in
                        RecordDoseCell(dose: dose)
                    }
                    RecordAddDoseButton()
                }
                .padding()
            }
            .navigationTitle("Summary")
            .navigationBarItems(trailing: InfoViewButton())
            .navigationBarTitleDisplayMode(.large)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
}
