//
//  RecordCellBackground.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct RecordCellBackground: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .paletteBackground()
            .paletteShadow()
    }
    
}
