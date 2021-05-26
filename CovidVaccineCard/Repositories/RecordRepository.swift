//
// See LICENSE file for this project’s licensing information.
//

import Foundation
import SwiftUI

/// A repository for loading and saving the user's vaccine record
class RecordRepository: ObservableObject {
    
    /// The user's vaccine record
    @Published var record = Record() {
        didSet {
            saveRecord()
        }
    }
    
    /// The names of the files in FileManager
    enum FileNameKeys: String {
        case userRecordFile
        case cardImageFront
        case cardImageBack
    }
    
    /// A repository for loading and saving the user's vaccine record
    init() {
        loadRecord()
    }
    
    /// Saves the user's vaccine record in FileManager
    private func saveRecord() {
        
        guard let docsUrl = FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask).first
        else { return }
        
        let fileName: String = FileNameKeys.userRecordFile.rawValue
        let fileURL = docsUrl.appendingPathComponent(fileName)
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(record) {
            try? encoded.write(to: fileURL, options: [.atomic, .completeFileProtection])
            print("Saved record.")
        }
        
    }
    
    /// Loads the user's vaccine record in FileManager
    private func loadRecord() {
        
        guard let docsURL = FileManager.default.urls(
                for: .documentDirectory,
                in: .userDomainMask).first
        else { return }
        
        let fileName = FileNameKeys.userRecordFile.rawValue
        let fileURL = docsURL.appendingPathComponent(fileName)
        
        do {
            let recordData = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode(Record.self, from: recordData) {
                self.record = decoded
                return
            }
        } catch {}
        
    }
    
    /// Removes a dose from the user's vaccine record
    /// - Parameter dose: The dose to be removed
    func removeDose(_ dose: Dose) {
        if let i = record.doses.firstIndex(where: { $0.id == dose.id }) {
            record.doses.remove(at: i)
        }
    }
    
    /// Adds a dose to the user's vaccine record
    /// - Parameter doseType: The type of dose to be added
    func addDose(_ doseType: DoseType) {
        record.doses.append(
            Dose(doseType: doseType)
        )
    }
    
    /// Saves an image to the user's vaccine record
    /// - Parameters:
    ///   - cardSide: The side of the card that the image has captured
    ///   - image: The image to be saved
    func saveImage(_ cardSide: CardSide, image: UIImage) {
        
        let fileName: String = cardSide == .front ? FileNameKeys.cardImageFront.rawValue : FileNameKeys.cardImageBack.rawValue
        
        guard let documentsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first else { return }
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        
        if let imageData = image.jpegData(compressionQuality: 1.0) {
            try? imageData.write(to: fileURL, options: [.atomic, .completeFileProtection])
            if cardSide == .front {
                record.cardImageFront = fileName
            } else {
                record.cardImageBack = fileName
            }
        }
        
    }
    
    /// Attempts to load an image of the user's vaccine record
    /// - Parameter cardSide: The side of the card that the image has captured
    /// - Returns: The image to be saved
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

