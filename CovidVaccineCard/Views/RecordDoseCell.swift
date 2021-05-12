//
//  RecordDoseCell.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct RecordDoseCell: View {
    
    @EnvironmentObject var recordVM: RecordViewModel
    
    let dose: Dose
    let dateFormatter: DateFormatter
    
    @State private var doseMake: String
    @State private var doseLot: String
    @State private var doseSite: String
    @State private var doseDate: Date
    
    init(dose: Dose) {
        self.dose = dose
        
        self._doseMake = State(initialValue: dose.make)
        self._doseLot  = State(initialValue: dose.lot)
        self._doseSite = State(initialValue: dose.site)
        self._doseDate = State(initialValue: dose.date)
        
        self.dateFormatter = DateFormatter()
        self.dateFormatter.dateStyle = .short
    }

    var body: some View {
        
        VStack {
            
            HStack {
                RecordCellHeader(
                    image: "heart.circle.fill",
                    color: Color.red,
                    label: dose.doseType.string
                )
                DeleteButton(dose: dose)
            }

            Divider()
            VStack(spacing: 5) {
                
                RecordCellTextField(
                    label: "Manufacturer:",
                    placeholder: "make",
                    text: $doseMake
                )
                
                RecordCellTextField(
                    label: "Lot Number:",
                    placeholder: "number",
                    text: $doseLot
                )
                
                RecordCellTextField(
                    label: "Clinic:",
                    placeholder: "clinic",
                    text: $doseSite
                )
                
                RecordCellDateField(
                    label: "Date Administered:",
                    date: $doseDate
                )
                
            }
        }
        .padding()
        .background(RecordCellBackground())
        .onChange(of: doseMake, perform: { _ in onChangeText() })
        .onChange(of: doseLot,  perform: { _ in onChangeText() })
        .onChange(of: doseSite, perform: { _ in onChangeText() })
        .onChange(of: doseDate, perform: { _ in onChangeDate() })
        
    }
    
    private func onChangeText() {
        guard let i = recordVM.record.doses.firstIndex(where: { $0.id == dose.id }) else { return }
        recordVM.record.doses[i].make = doseMake
        recordVM.record.doses[i].lot  = doseLot
        recordVM.record.doses[i].site = doseSite
    }
    
    private func onChangeDate() {
        guard let i = recordVM.record.doses.firstIndex(where: { $0.id == dose.id }) else { return }
        recordVM.record.doses[i].date = doseDate
        recordVM.save()
    }
    
}

fileprivate struct DeleteButton: View {
    
    @EnvironmentObject var recordVM: RecordViewModel
    
    let dose: Dose
    
    @State private var showingAlert = false
    
    var body: some View {
        Button(action: {
            self.showingAlert = true
        }) {
            Image(systemName: "multiply.circle.fill")
            .resizable().scaledToFit().frame(width: 18, height: 18)
            .foregroundColor(Color.gray.opacity(0.8))
        }
        .alert(isPresented: $showingAlert, content: {
            Alert(
                title: Text("Are you sure you want to delete this dose record?"),
                primaryButton: Alert.Button.destructive(Text("Yes"), action: onAlertConfirm),
                secondaryButton: Alert.Button.cancel()
            )
        })
    }
    
    private func onAlertConfirm() {
        withAnimation(.default) {
            recordVM.removeDose(dose)
        }
    }
    
}
