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
            CheckView(check: check)
            
        } else if let checks    = modelState.checks,
                  let checklist = modelState.checklist,
                  let airframe  = modelState.airframe {
            ChecksView(
                airframe:  airframe,
                checklist: checklist,
                checks:    checks
            )
            
        } else if let checklists = modelState.checklists,
                  let features = modelState.features,
                  let airframe = modelState.airframe {
            ChecklistsView(
                airframe:   airframe,
                features:   features,
                checklists: checklists
            )
            
        } else if let features = modelState.features,
                  let airframe = modelState.airframe {
            FeaturesView(
                airframe: airframe,
                features: Binding { features } set: {
                    modelState.features = $0
                }
            )
            
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
