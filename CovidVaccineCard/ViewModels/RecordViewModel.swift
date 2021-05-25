//
// See LICENSE file for this project’s licensing information.
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
        recordRepository.saveImage(cardSide, image: image)
    }
    
    func loadImage(_ cardSide: CardSide) -> UIImage? {
        recordRepository.loadImage(cardSide)
    }
    
}
