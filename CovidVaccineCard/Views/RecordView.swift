//
//  RecordList.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct RecordView: View {
    
    @EnvironmentObject var recordVM: RecordViewModel
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15) {
                    RecordImageCell()
                    RecordInfoCell()
                    ForEach(recordVM.record.doses, id: \.id) { dose in
                        RecordDoseCell(dose: dose)
                    }
                    RecordAddDoseButton()
                }
                .padding()
            }
            .navigationTitle("Summary")
            .navigationBarItems(trailing: InfoViewButton())
            .navigationBarTitleDisplayMode(.large)
        }
    }
    
}
