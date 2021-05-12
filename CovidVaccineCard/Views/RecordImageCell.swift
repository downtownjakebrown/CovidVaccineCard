//
//  RecordImageCell.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct RecordImageCell: View {
    
    var body: some View {
        VStack {
            RecordCellHeader(
                image: "staroflife.circle.fill",
                color: Color.green,
                label: "Card Photos"
            )
            Divider()
            HStack {
                RecordImageCellBlock(cardSide: .front)
                RecordImageCellBlock(cardSide: .back)
            }.padding(.top, 6)
        }
        .padding()
        .background(RecordCellBackground())
    }
    
}
