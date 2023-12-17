//
//  ChecksList.swift
//  Checklists
//
//  Created by Logan Barnes on 12/15/23.
//

import SwiftUI

struct ChecksView: View {
    var airframe: String
    var checklist: Checklist
    var checks: [ChecklistEntry]
    
    var body: some View {
        VStack {
            BackButton()
            
            Text(checklist.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text(airframe)
                .font(.headline)
            
            List{
                ForEach(checks) {check in
                    HStack {
                        Text(check.check)
                        Spacer()
                        Text(check.response)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    let airframe = "R44 Cadet"
    
    return ChecksView(airframe: airframe,
                      checklist: ChecklistData().airframeChecklists[airframe]![0],
                      checks: ChecklistData().airframeChecklists[airframe]![0].checks)
    .environment(ModelState())
}
