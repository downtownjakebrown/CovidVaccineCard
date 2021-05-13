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
                HStack {
                    Spacer()
                    Image(systemName: "questionmark.circle.fill")
                        .imageScale(.large)
                        .foregroundColor(.blue)
                        .frame(width: 28, height: 28)
                }
                .frame(width: 40, height: 40)
            }
        )
    }
}
