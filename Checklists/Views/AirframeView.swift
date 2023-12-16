//
//  AirframeView.swift
//  Checklists
//
//  Created by Logan Barnes on 12/15/23.
//

import SwiftUI

struct AirframeView: View {
    @Environment(ChecklistData.self) var checklistData
    
    var body: some View {
        
        ForEach(checklistData.airframes, id:\.self) {airframe in
                    HStack {
                        Text(airframe)
                        Text(checklistData.airframeChecklists[airframe]?[0].checklistName ?? "No checklist")
                    }
                }
        
//        List{
//            ForEach(checklistData.airframeChecklists) { airframe, checklist in
//                HStack {
////                    Text(airframe)
//                    Text(checklist.checklistName)
//                }
//            }
//        }
    }
}

#Preview {
    AirframeView()
        .environment(ChecklistData())
}
