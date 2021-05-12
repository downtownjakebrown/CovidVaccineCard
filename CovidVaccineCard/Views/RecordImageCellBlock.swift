//
//  RecordImageCellBlock.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/12/21.
//

import SwiftUI

struct RecordImageCellBlock: View {
    
    @EnvironmentObject var recordVM: RecordViewModel
    
    let cardSide: CardSide
    
    @State private var showSheet = false
    @State private var activeSheet: ActiveSheet? = nil
    
    @State private var showingActionSheet = false
    
    @State private var imageSource: UIImagePickerController.SourceType = .camera
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    var body: some View {
        Button(action: {
            if image == nil {
                self.showingActionSheet = true
            } else {
                self.activeSheet = .imageDetail
                self.showSheet = true
            }
        }) {
            if image != nil {
                
                image!
                    .resizable()
                    .scaledToFill()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                
            } else {
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(Color.gray.opacity(0.2))
                    .frame(height: 100)
                    .overlay(
                        Text(cardSide == .front ? "Front" : "Back")
                        .font(.subheadline)
                        .foregroundColor(Color.gray.opacity(0.9))
                    )
            }
        }
        .sheet(isPresented: $showSheet, onDismiss: saveImage) {
            if activeSheet == .imagePicker {
                ImagePicker(image: self.$inputImage, sourceType: imageSource)
                .ignoresSafeArea()
            } else {
                NavigationView {
                    image?
                        .resizable()
                        .scaledToFit()
                        .ignoresSafeArea()
                        .navigationTitle(cardSide == .front ? "Card Front" : "Card Back")
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarItems(
                            leading: replaceButton,
                            trailing: Button("Done", action: { self.showSheet = false })
                        )
                }
            }
        }
        .actionSheet(isPresented: $showingActionSheet) {
            ActionSheet(
                title: Text("How do you want to add photos?"),
                buttons: [
                    .default(Text("Camera"))        { showImagePicker(.camera)           },
                    .default(Text("Photo Library")) { showImagePicker(.photoLibrary)     },
                    .default(Text("Saved Albums"))  { showImagePicker(.savedPhotosAlbum) },
                    .cancel()
                ]
            )
        }
        .onAppear {
            image = recordVM.loadImage(cardSide)
        }
    }
    
    func showImagePicker(_ source: UIImagePickerController.SourceType) {
        self.imageSource = source
        self.activeSheet = .imagePicker
        self.showSheet = true
    }
    
    func saveImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
        recordVM.saveImage(cardSide, image: inputImage)
    }
    
    var replaceButton: some View {
        Button("Replace", action: {
            self.showSheet = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.showingActionSheet = true
            }
        })
    }
    
}

fileprivate enum ActiveSheet {
   case imagePicker
   case imageDetail
   var id: Int {
      hashValue
   }
}
