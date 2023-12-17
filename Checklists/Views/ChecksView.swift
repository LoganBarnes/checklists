//
//  ChecksList.swift
//  Checklists
//
//  Created by Logan Barnes on 12/15/23.
//

import SwiftUI

struct ChecksView: View {
    @Environment(ModelState.self) var modelState
    
    var airframe: String
    var checklist: Checklist
    
    var body: some View {
        VStack {
            Button {
                modelState.checklist = nil
                modelState.currentView = .Checklists
                
            } label: {
                HStack() {
                    Image(systemName: "chevron.backward")
                    Text("\(airframe) Checklists")
                    Spacer()
                }
                .padding()
            }
            
            Text(checklist.title)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            
            List{
                ForEach(checklist.checks) {check in
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
    ChecksView(airframe: "R44 Cadet",
               checklist: ChecklistData().checklists[1])
        .environment(ModelState())
}
