//
//  VaccineRecord.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct VaccineRecord: Hashable {
    let info: PatientInfo
    let doses: [Dose]
    let images: [String]
}

struct PatientInfo: Hashable {
    let name: Name
    let DOB: FormattedDate
    let ID: String
}

struct Name: Hashable {
    let first: String
    let last: String
    let middle: String
    var full: String {
        first + " " + middle + " " + last
    }
}

struct FormattedDate: Hashable {
    let dd: String
    let mm: String
    let yy: String
    var date: String {
        "\(dd)/\(mm)/\(yy)"
    }
}

struct Dose: Hashable {
    let doseType: DoseType
    let productName: String
    let lotNumber: String
    let date: FormattedDate
    let site: String
}

enum DoseType {
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
