//
//  RecordCellBackground.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct RecordCellBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.white)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
    }
}
