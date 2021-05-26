//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

/// The user's vaccine record
struct Record: Codable {
    /// The user's name
    var name: String = ""
    /// The user's birth date
    var birthDate: Date = Date()
    /// The user's patient identifier
    var patientID: String = ""
    /// The user's vaccine doses
    var doses: [Dose] = [Dose(doseType: .firstDose)]
    /// The front image of the user's vaccine card
    var cardImageFront: String?
    /// The back image of the user's vaccine card
    var cardImageBack: String?
}
