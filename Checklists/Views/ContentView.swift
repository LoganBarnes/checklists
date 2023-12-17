//
//  ContentView.swift
//  Checklists
//
//  Created by Logan Barnes on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(ModelState.self) var modelState
    
    var body: some View {
        
        if let check = modelState.check {
            Text("CheckEntryView: \(check.check)")
            
        } else if let checklist = modelState.checklist {
            ChecksView(airframe: modelState.airframe!,
                       checklist: checklist,
                       checks: modelState.checks!)
            
        } else if let checklists = modelState.checklists {
            ChecklistsView(airframe: modelState.airframe!,
                           checklists: checklists)
            
        } else if let features = modelState.features {
            let binding = Binding {
                features
            } set: {
                modelState.features = $0
            }
            FeaturesView(airframe: modelState.airframe!,
                         features: binding)
            
        } else {
            AirframeView()
            
        }
    }
}

#Preview {
    ContentView()
        .environment(ChecklistData())
        .environment(ModelState())
}
