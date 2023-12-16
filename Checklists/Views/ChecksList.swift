//
//  ChecksList.swift
//  Checklists
//
//  Created by Logan Barnes on 12/15/23.
//

import SwiftUI

struct ChecksList: View {
    @Environment(ModelState.self) var modelState
    
    var checklist: Checklist
    
    var body: some View {
        VStack {
            Button {
                modelState.checklist = nil
                modelState.currentView = .Checklists
                
            } label: {
                HStack() {
                    Image(systemName: "chevron.backward")
                    Text("\(checklist.airframe) Checklists")
                    Spacer()
                }
                .padding()
            }
            
            Text(checklist.checklistName)
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
    ChecksList(checklist: ChecklistData().checklists[1])
        .environment(ModelState())
}
