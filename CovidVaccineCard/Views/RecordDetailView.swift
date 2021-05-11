//
//  RecordDetailView.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct RecordDetailView: View {
    
    let record: VaccineRecord
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                PatientInfoCell(record: record)
                CardImageCell()
                ForEach(record.doses, id: \.self) { dose in
                    DoseInfoCell(dose: dose)
                }
                AddDoseInfoButton()
            }.padding()
        }
        .navigationBarTitle("Vaccine Record")
        .navigationBarTitleDisplayMode(.inline)
        .background(Color(#colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)).ignoresSafeArea())
    }
    
}

struct CardImageCell: View {
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "photo.fill.on.rectangle.fill")
                    .resizable().scaledToFit().frame(width: 16, height: 16)
                    .foregroundColor(Color.green)
                Text("Card Photos")
                    .font(.headline)
                Spacer()
            }
            Divider()
            HStack {
                CardImageBlock(defaultText: "Front")
                CardImageBlock(defaultText: "Back")
            }.padding(.top, 6)
        }
        .padding()
        .background(CardBackground())
    }
    
}

struct CardImageBlock: View {
    
    let defaultText: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
            .fill(Color.gray.opacity(0.2))
            .frame(height: 100)
            .overlay(
                Text(defaultText)
                .font(.subheadline)
                .foregroundColor(Color.gray.opacity(0.9))
            )
    }
    
}

struct PatientInfoCell: View {
    
    let record: VaccineRecord
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "heart.text.square.fill")
                    .resizable().scaledToFit().frame(width: 16, height: 16)
                    .foregroundColor(Color.blue)
                Text("Patient Info")
                    .font(.headline)
                Spacer()
            }
            Divider()
            VStack(spacing: 5) {
                HStack {
                    Text("Name:").font(.subheadline)
                    Spacer()
                    Text(record.info.name.full).font(.subheadline)
                }
                HStack {
                    Text("Date of Birth:").font(.subheadline)
                    Spacer()
                    Text(record.info.DOB.date).font(.subheadline)
                }
                HStack {
                    Text("Patient Number:").font(.subheadline)
                    Spacer()
                    Text(record.info.ID).font(.subheadline)
                }
            }
        }
        .padding()
        .background(CardBackground())
    }
    
}

struct DoseInfoCell: View {
    
    let dose: Dose
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "heart.circle.fill")
                    .resizable().scaledToFit().frame(width: 18, height: 18)
                    .foregroundColor(Color.red)
                Text(dose.doseType.string)
                    .font(.headline)
                Spacer()
            }
            Divider()
            VStack(spacing: 5) {
                HStack {
                    Text("Manufacturer:").font(.subheadline)
                    Spacer()
                    Text(dose.productName).font(.subheadline)
                }
                HStack {
                    Text("Lot Number:").font(.subheadline)
                    Spacer()
                    Text(dose.lotNumber).font(.subheadline)
                }
                HStack {
                    Text("Date Administered:").font(.subheadline)
                    Spacer()
                    Text(dose.date.date).font(.subheadline)
                }
                HStack {
                    Text("Clinic:").font(.subheadline)
                    Spacer()
                    Text(dose.site).font(.subheadline)
                }
            }
        }
        .padding()
        .background(CardBackground())
    }
    
}

struct AddDoseInfoButton: View {
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.red)
                .shadow(color: Color.gray.opacity(0.3), radius: 10)
            Image(systemName: "plus")
                .resizable()
                .scaledToFit()
                .foregroundColor(.white)
                .padding()
        }
        .frame(width: 50, height: 50)
    }
}

struct CardBackground: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10, style: .continuous)
        .fill(Color.white)
        .shadow(color: Color.gray.opacity(0.3), radius: 10)
    }
}

// MARK: - Preview
#if DEBUG
struct RecordDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecordDetailView(record: TestData.records.first!)
    }
}
#endif
