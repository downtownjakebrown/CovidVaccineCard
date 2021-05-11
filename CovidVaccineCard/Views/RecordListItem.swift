//
//  CardView.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct RecordListItem: View {
    
    let record: VaccineRecord

    var body: some View {
        VStack {
            HStack(spacing: 12) {
                RecordListItemIcon()
                RecordListItemText(record: record)
                Spacer()
                RecordListItemChevron()
            }
        }
        .padding()
        .background(background)
        .padding()
    }
    
    var background: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.white)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
    }
    
}

fileprivate struct RecordListItemIcon: View {
    var body: some View {
        Circle()
            .fill(Color.red)
            .frame(width: 35, height: 35)
    }
}

fileprivate struct RecordListItemText: View {
    
    let record: VaccineRecord
    
    var recordName: String {
        record.info.name.first + " " +
        record.info.name.middle + " " +
        record.info.name.last
    }
    
    var body: some View {
        VStack(spacing: 3) {
            HStack {
                Text("Covid Vaccine")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
            }
            HStack {
                Text(recordName)
                    .font(.subheadline)
                    .foregroundColor(.black)
                Spacer()
            }
        }
    }
    
}

fileprivate struct RecordListItemChevron: View {
    var body: some View {
        Image(systemName: "chevron.right")
            .resizable()
            .scaledToFit()
            .foregroundColor(.black)
            .frame(height: 13)
    }
}
