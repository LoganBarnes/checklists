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
    var features: [String: Bool]
    var checklists: [Checklist]
    
    var body: some View {
        VStack {
            BackButton()
            
            HStack{
                AirframeImage(image: Image(airframe))
                    .frame(width:100)
                    .padding()
                VStack {
                    Text(airframe)
                    Text("Checklists")
                }
                .padding()
            }
            
            List {
                ForEach(checklists, id: \.title) {checklist in
                    Button {
                        modelState.checklist = checklist
                        modelState.checks    = checklist.checks.filter { check in
                            return check.supportsAirframe(airframe: airframe)
                            && (check.feature == nil || features[check.feature!] ?? false)
                        }
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
    let airframe = "R44 Raven II"
    
    return ChecklistsView(airframe: airframe,
                          features: ChecklistData().airframeFeatures[airframe]!,
                          checklists: ChecklistData().airframeChecklists[airframe]!)
    .environment(ChecklistData())
    .environment(ModelState())
}
