//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        RecordView().environmentObject(RecordViewModel())
    }
}

// MARK: - Preview
#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(ColorScheme.allCases, id: \.self) {
            MainView().preferredColorScheme($0)
        }
    }
}
#endif
