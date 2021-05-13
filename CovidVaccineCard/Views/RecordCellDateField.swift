//
//  RecordCellDateField.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/12/21.
//

import SwiftUI

struct RecordCellDateField: View {
    
    @EnvironmentObject var recordVM: RecordViewModel
    
    @State private var showPicker: Bool = false
    @Binding private var date: Date
    
    private let label: String
    private let dateFormatter: DateFormatter
    
    init(label: String, date: Binding<Date>) {
        self.label = label
        self._date = date
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .short
    }
    
    var body: some View {
        VStack {
            
            Button(action: {
                withAnimation(.default) {
                    self.showPicker.toggle()
                }
            }) {
                HStack {
                    Text(label).font(.body).foregroundColor(Color.primary)
                    Spacer()
                    Text(dateFormatter.string(from: date)).font(.body).foregroundColor(Color.primary)
                }
            }
            
            if showPicker {
                VStack(spacing: 0) {
                    DatePicker(
                        "",
                        selection: $date,
                        displayedComponents: .date
                    )
                    .datePickerStyle(GraphicalDatePickerStyle())
                    .labelsHidden()
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(Color.gray.opacity(0.1))
                )
            }
            
        }
        .onChange(of: date, perform: { _ in
            recordVM.save()
        })
        
    }
    
}
