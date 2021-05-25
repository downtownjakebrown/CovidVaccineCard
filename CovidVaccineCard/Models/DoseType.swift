//
// See LICENSE file for this project’s licensing information.
//

import Foundation

enum DoseType: String, Codable {
    case firstDose
    case secondDose
    case other
    var asString: String {
        switch self {
        case .firstDose: return "First Dose"
        case .secondDose: return "Second Dose"
        case .other: return "Other"
        }
    }
}
