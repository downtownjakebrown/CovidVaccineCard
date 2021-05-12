//
//  DoseType.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/12/21.
//

import Foundation

enum DoseType: String, Codable {
    case firstDose
    case secondDose
    case other
    var string: String {
        switch self {
        case .firstDose: return "First Dose"
        case .secondDose: return "Second Dose"
        case .other: return "Other"
        }
    }
}
