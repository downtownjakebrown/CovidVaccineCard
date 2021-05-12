//
//  RecordRepository.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import Foundation

class RecordRepository: ObservableObject {
    
    @Published var record: Record {
        didSet {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(record) {
                UserDefaults.standard.set(encoded, forKey: "Record")
                print("Saved record.")
            }
        }
    }
    
    init() {
        if let record = UserDefaults.standard.data(forKey: "Record") {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Record.self, from: record) {
                self.record = decoded
                return
            }
        }
        self.record = Record()
    }
    
    func removeDose(_ dose: Dose) {
        if let i = record.doses.firstIndex(where: { $0.id == dose.id }) {
            record.doses.remove(at: i)
        }
    }
    
    func addDose(_ doseType: DoseType) {
        record.doses.append(
            Dose(doseType: doseType)
        )
    }
    
}

