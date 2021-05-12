//
//  VaccineRecord.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
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
