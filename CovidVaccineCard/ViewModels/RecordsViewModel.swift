//
//  VaccinesViewModel.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

class RecordsViewModel: ObservableObject {
    
    @Published var records: [VaccineRecord]
    
    init() {
        records = TestData.records
    }
    
}

struct TestData {
    
    static let records: [VaccineRecord] = [
        VaccineRecord(
            info: PatientInfo(name: Name(first: "Jacob", last: "Brown", middle: "A."),
                              DOB: FormattedDate(dd: "01", mm: "28", yy: "1994"),
                              ID: "PATID123"),
            doses: [
                Dose(doseType: .firstDose,
                     productName: "Moderna",
                     lotNumber: "LOT1234",
                     date: FormattedDate(dd: "04", mm: "10", yy: "2021"),
                     site: "Morrisania"),
                Dose(doseType: .secondDose,
                     productName: "Moderna",
                     lotNumber: "LOT1234",
                     date: FormattedDate(dd: "05", mm: "08", yy: "2021"),
                     site: "Morrisania")
            ],
            images: ["",
                     ""]
        )
    ]
    
}
