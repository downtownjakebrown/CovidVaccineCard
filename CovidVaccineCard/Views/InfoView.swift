//
//  InfoView.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/12/21.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            List {
                
                Section(
                    header: Text("Why use this app?")
                ) {
                    Text("To keep a digital record of your COVID-19 vaccination details.")
                }
            
                Section(
                    header: Text("Is my information shared with anyone?")
                ) {
                    Text("No! Your data never leaves your device.")
                }
                
                Section(
                    header: Text("Do I need to keep my paper COVID-19 vaccination record card?")
                ) {
                    Text("Yes! Keep your card in a safe place.")
                }
                
            }
            .listStyle(
                GroupedListStyle()
            )
        }
        .navigationTitle("About")
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Preview
#if DEBUG
struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            InfoView()
        }
    }
}
#endif
