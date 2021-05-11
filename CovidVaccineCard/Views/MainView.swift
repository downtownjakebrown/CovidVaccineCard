//
//  MainView.swift
//  CovidVaccineCard
//
//  Created by jacob brown on 5/11/21.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        RecordList().environmentObject(RecordsViewModel())
    }
}

// MARK: - Preview
#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
#endif
