//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI
import Combine

/// A view model for handling the user's vaccine record
class RecordViewModel: ObservableObject {
    
    /// The user's vaccine record
    @Published var record: Record = Record()
    /// A repository for loading and saving the user's vaccine record
    private var recordRepository = RecordRepository()
    /// A combine helper
    private var cancellables = Set<AnyCancellable>()
    
    /// A view model for handling the user's vaccine record
    init() {
        recordRepository.$record
        .assign(to: \.record, on: self)
        .store(in: &cancellables)
    }
    
    /// Saves the user's vaccine record locally
    func save() {
        recordRepository.record = record
    }
    
    /// Removes a dose from the user's vaccine record
    /// - Parameter dose: The dose to be removed
    func removeDose(_ dose: Dose) {
        recordRepository.removeDose(dose)
    }
    
    /// Adds a dose to the user's vaccine record
    /// - Parameter doseType: The type of dose to be added
    func addDose(_ doseType: DoseType) {
        recordRepository.addDose(doseType)
    }
    
    /// Saves an image to the user's vaccine record
    /// - Parameters:
    ///   - cardSide: The side of the card that the image has captured
    ///   - image: The image to be saved
    func saveImage(_ cardSide: CardSide, image: UIImage) {
        recordRepository.saveImage(cardSide, image: image)
    }
    
    /// Attempts to load an image of the user's vaccine record
    /// - Parameter cardSide: The side of the card that the image has captured
    /// - Returns: The image to be saved
    func loadImage(_ cardSide: CardSide) -> UIImage? {
        recordRepository.loadImage(cardSide)
    }
    
}
