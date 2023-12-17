//
//  ChecklistList.swift
//  Checklists
//
//  Created by Logan Barnes on 12/15/23.
//

import SwiftUI

struct ChecklistsView: View {
    @Environment(ModelState.self) var modelState
    
    var airframe: String
    var model: String
    var checklists: [Checklist]
    
    var body: some View {
        VStack {
            Button {
                modelState.airframe    = nil
                modelState.currentView = .Airframe
            } label: {
                HStack() {
                    Image(systemName: "chevron.backward")
                    Text(model.isEmpty ? "Airframes" : "\(airframe) Models")
                    Spacer()
                }
                .padding()
            }
            
            HStack{
                AirframeImage(image: Image(model.isEmpty ? airframe : model))
                    .frame(width:100)
                    .padding()
                VStack {
                    Text("\(airframe) Checklists")
                    Text(model)
                        .font(.footnote)
                }
                .padding()
            }
            
            List {
                ForEach(checklists, id: \.title) {checklist in
                    Button {
                        modelState.checklist = checklist
                        modelState.currentView = .Checks
                    } label: {
                        Text(checklist.title)
                            .font(.title2)
                    }
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    ChecklistsView(airframe: "R44",
                   model: "Raven II",
                   checklists: ChecklistData().checklists)
    .environment(ModelState())
}
