//
//  RecordImageLinkView.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/13/21.
//

import SwiftUI

struct RecordImageLinkView: View {
        
    @EnvironmentObject var recordVM: RecordViewModel
    
    @State private var showPickerSheet = false
    @State private var showActionSheet = false
    @State private var imageSource: UIImagePickerController.SourceType = .camera
    
    @State private var localUIImage: UIImage?
    
    @State private var uiImage: UIImage
    @State private var image: Image
    private let cardSide: CardSide
    
    init(image: Image, uiImage: UIImage, cardSide: CardSide) {
        self._image = State(initialValue: image)
        self._uiImage = State(initialValue: uiImage)
        self.cardSide = cardSide
    }
    
    var body: some View {
        NavigationLink(
            destination:
                
                VStack {
                    Spacer()
                    image
                        .resizable()
                        .scaledToFit()
                        .navigationTitle(cardSide == .front ? "Card Front" : "Card Back")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(trailing: shareButton)
                    Spacer()
                    replaceButton
                }
            
            ,
            label: {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
            }
        )
    }
    
    var shareButton: some View {
        Button(action: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                
                
                // for iPhone
                let activityVC = UIActivityViewController(activityItems: [uiImage], applicationActivities: nil)
                UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
                
                // for iPad?
                
            }
        }) {
            HStack {
                Spacer()
                Image(systemName: "square.and.arrow.up")
                    .imageScale(.large)
                    .frame(width: 28, height: 28)
            }
            .frame(width: 40, height: 40)
        }
    }
    
    var replaceButton: some View {
        Button(action: {
            self.showActionSheet = true
        }) {
            Text("Replace").padding()
        }
        .sheet(isPresented: $showPickerSheet, onDismiss: saveImage) {
            ImagePicker(
                image: self.$localUIImage,
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
    }
    
    func showImagePicker(_ source: UIImagePickerController.SourceType) {
        self.imageSource = source
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            self.showPickerSheet = true
        }
    }
    
    func saveImage() {
        guard let inputImage = localUIImage else { return }
        uiImage = inputImage
        image = Image(uiImage: inputImage)
        recordVM.saveImage(cardSide, image: inputImage)
    }
    
}
