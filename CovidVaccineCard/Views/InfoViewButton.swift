//
//  InfoViewButton.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/12/21.
//

import SwiftUI

struct InfoViewButton: View {
    var body: some View {
        NavigationLink(
            destination: InfoView(),
            label: {
                Image(systemName: "questionmark.circle.fill")
                    .resizable()
                    .scaledToFit()
                    .imageScale(.large)
                    .foregroundColor(.blue)
            }
        )
    }
}
