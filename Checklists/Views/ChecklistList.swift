//
//  ChecklistList.swift
//  Checklists
//
//  Created by Logan Barnes on 12/15/23.
//

import SwiftUI

struct ChecklistList: View {
    @Environment(ModelState.self) var modelState
    
    var airframe: String
    var checklists: [Checklist]
    
    var body: some View {
        VStack {
            Button {
                modelState.checklists = nil
                modelState.airframe = nil
                modelState.currentView = .Airframe
                
            } label: {
                HStack() {
                    Image(systemName: "chevron.backward")
                    Text("Airframes")
                    Spacer()
                }
                .padding()
            }
            
            HStack{
                AirframeImage(image: Image(airframe))
                    .frame(width:100)
                    .padding()
                Text("\(airframe) Checklists")
                    .padding()
            }
            
            List{
                ForEach(checklists, id: \.checklistName) {checklist in
                    Button {
                        modelState.checklist = checklist
                        modelState.currentView = .Checks
                    } label: {
                        Text(checklist.checklistName)
                    }
                }
            }
        }
    }
}

#Preview {
    ChecklistList(airframe: "R44", checklists: ChecklistData().checklists)
        .environment(ModelState())
}
