//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

struct Record: Codable {
    
    var name: String = ""
    var birthDate: Date = Date()
    var patientID: String = ""
    
    var doses: [Dose] = [Dose(doseType: .firstDose)]
    
    var cardImageFront: String?
    var cardImageBack: String?
    
}
