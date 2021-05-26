//
// See LICENSE file for this project’s licensing information.
//

import Foundation

/// The type of vaccine dose
enum DoseType: String, Codable {
    
    case firstDose
    case secondDose
    case other
    
    /// A string describing the type of vaccine dose
    var asString: String {
        switch self {
        case .firstDose: return "First Dose"
        case .secondDose: return "Second Dose"
        case .other: return "Other"
        }
    }
    
}
