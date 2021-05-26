//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

/// A button to link to the app's info view
struct InfoViewButton: View {
    var body: some View {
        NavigationLink(
            destination: InfoView(),
            label: {
                HStack {
                    Spacer()
                    Image(systemName: "questionmark.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                        .frame(width: 28, height: 28)
                }
                .frame(width: 40, height: 40)
            }
        )
    }
}
