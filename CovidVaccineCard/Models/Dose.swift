//
// See LICENSE file for this project’s licensing information.
//

import Foundation

struct Dose: Identifiable, Codable {
    var id = UUID()
    var doseType: DoseType = .firstDose
    var make: String = ""
    var lot: String = ""
    var date: Date = Date()
    var site: String = ""
}
