//
// See LICENSE file for this project’s licensing information.
//

import SwiftUI

struct RecordImageCellBlock: View {
    
    @EnvironmentObject var recordVM: RecordViewModel
    @Environment(\.colorScheme) var colorScheme
    
    let cardSide: CardSide
    
    @State private var showPickerSheet = false
    @State private var showActionSheet = false
    
    @State private var imageSource: UIImagePickerController.SourceType = .camera
    @State private var uiImage: UIImage?
    @State private var image: Image?
    
    var body: some View {
        Group {
            if image == nil {
                Button(action: {
                    self.showActionSheet = true
                }) {
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(colorScheme == .light ? Color.gray.opacity(0.15) : Color.gray.opacity(0.1))
                        .frame(height: 100)
                        .overlay(
                            Text(cardSide == .front ? "Front" : "Back")
                            .font(.subheadline)
                            .foregroundColor(Color.gray)
                        )
                }
                .sheet(isPresented: $showPickerSheet, onDismiss: saveImage) {
                    ImagePicker(
                        image: self.$uiImage,
                        sourceType: imageSource
                    )
                    .ignoresSafeArea()
                }
                .actionSheet(isPresented: $showActionSheet) {
                    ActionSheet(
                        title: Text("How do you want to add a photo?"),
                        buttons: [
                            .default(Text("Camera"))        { showImagePicker(.camera)           },
                            .default(Text("Photo Library")) { showImagePicker(.photoLibrary)     },
                            .default(Text("Saved Albums"))  { showImagePicker(.savedPhotosAlbum) },
                            .cancel()
                        ]
                    )
                }
            } else {
                RecordImageLinkView(
                    image: image!,
                    uiImage: uiImage!,
                    cardSide: cardSide
                )
            }
        }
        .onAppear {
            if let loadedImage = recordVM.loadImage(cardSide) {
                uiImage = loadedImage
                image = Image(uiImage: loadedImage)
            }
        }
    }
    
    func showImagePicker(_ source: UIImagePickerController.SourceType) {
        self.imageSource = source
        self.showPickerSheet = true
    }
    
    func saveImage() {
        guard let inputImage = uiImage else { return }
        image = Image(uiImage: inputImage)
        recordVM.saveImage(cardSide, image: inputImage)
    }
    
}
