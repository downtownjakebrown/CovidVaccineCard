//
//  RecordAddDoseButton.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct RecordAddDoseButton: View {
    
    @EnvironmentObject var recordVM: RecordViewModel
    
    @State private var showingAlert = false
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: {
            showingAlert = true
        }) {
            ZStack {
                Circle()
                    .fill(Color.red)
                    .shadow(color: Color.gray.opacity(0.3), radius: 10)
                Image(systemName: "plus")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(colorScheme == .light ? Color.white : Color(UIColor.systemBackground))
                    .padding()
            }
            .frame(width: 50, height: 50)
        }
        .actionSheet(isPresented: $showingAlert) {
            ActionSheet(
                title: Text("What type of dose do you want to add?"),
                buttons: [
                    .default(Text("First Dose"))  { addDose(.firstDose)  },
                    .default(Text("Second Dose")) { addDose(.secondDose) },
                    .default(Text("Other"))       { addDose(.other)      },
                    .cancel()
                ]
            )
        }
    }
    
    private func addDose(_ doseType: DoseType) {
        withAnimation(.default) {
            recordVM.addDose(doseType)
        }
    }
    
}
