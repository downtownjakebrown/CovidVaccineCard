//
//  VaccinesViewModel.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI
import Combine

class RecordViewModel: ObservableObject {
    
    @Published var record: Record = Record()
    
    private var recordRepository = RecordRepository()
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        recordRepository.$record
        .assign(to: \.record, on: self)
        .store(in: &cancellables)
    }
    
    func removeDose(_ dose: Dose) {
        recordRepository.removeDose(dose)
    }
    
    func addDose(_ doseType: DoseType) {
        recordRepository.addDose(doseType)
    }
    
    func save() {
        recordRepository.record = record
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
            save()
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
