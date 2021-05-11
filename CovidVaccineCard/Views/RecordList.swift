//
//  RecordList.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct RecordList: View {
    
    @EnvironmentObject var vaccineViewModel: RecordsViewModel
    
    var body: some View {
        ColorNavigationView(Color(#colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1))) {
            VStack {
                ForEach(vaccineViewModel.records, id: \.self) { record in
                    NavigationLink(destination: RecordDetailView(record: record)) {
                        RecordListItem(record: record)
                    }
                }
            }
        }
    }
    
}

fileprivate struct ColorNavigationView<Content: View>: View {
    
    let backgroundColor: Color
    let content: () -> Content
    
    init(_ backgroundColor: Color, _ content: @escaping () -> Content) {
        self.backgroundColor = backgroundColor
        self.content = content
    }
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                content()
            }
            .navigationTitle("Records")
            .navigationBarItems(
                trailing: button
            )
            .background(backgroundColor.ignoresSafeArea())
        }
    }
    
    var button: some View {
        Image(systemName: "questionmark.circle.fill")
            .resizable()
            .scaledToFit()
            .imageScale(.large)
    }
    
}
