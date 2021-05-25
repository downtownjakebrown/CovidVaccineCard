//
// See LICENSE file for this project’s licensing information.
//

import Foundation
import SwiftUI

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
    
    func saveImage(_ cardSide: CardSide, image: UIImage) {
        
        let fileName: String = cardSide == .front ? "cardImageFront" : "cardImageBack"
        
        guard let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            try? imageData.write(to: fileURL, options: .atomic)
            if cardSide == .front {
                record.cardImageFront = fileName
            } else {
                record.cardImageBack = fileName
            }
        }
        
    }
    
    func loadImage(_ cardSide: CardSide) -> UIImage? {
        
        guard
            let docsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first,
            let cardURL = cardSide == .front ? record.cardImageFront : record.cardImageBack
        else { return nil }
        
        let fileURL = docsURL.appendingPathComponent(cardURL)
        
        do {
            let imageData = try Data(contentsOf: fileURL)
            if let uiImage = UIImage(data: imageData) {
                return uiImage
            }
        } catch {}
        return nil
        
    }
    
}

