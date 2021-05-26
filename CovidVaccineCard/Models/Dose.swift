//
// See LICENSE file for this project’s licensing information.
//

import Foundation

/// A vaccine dose and associated information
struct Dose: Identifiable, Codable {
    /// A unique ID for the dose
    var id = UUID()
    /// The type of vaccine dose
    var doseType: DoseType = .firstDose
    /// The manufacturer of the dose
    var make: String = ""
    /// The lot number of the dose
    var lot: String = ""
    /// The date the dose was administered
    var date: Date = Date()
    /// The location (e.g., the clinic) where the dose was administered
    var site: String = ""
}
