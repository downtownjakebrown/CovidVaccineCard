//
//  Dose.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
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
