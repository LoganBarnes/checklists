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
        switch modelState.currentView {
        case .Airframe:
            AirframeView()
            
        case .Models:
            ModelView(airframe: modelState.airframe!,
                      models: modelState.models!)
            
        case .Checklists:
            ChecklistsView(airframe: modelState.airframe!,
                           model: modelState.model ?? "",
                           checklists: modelState.checklists!)
            
        case .Checks:
            ChecksView(checklist: modelState.checklist!)
            
        case .CheckEntry:
            AirframeView()
        }
    }
}

#Preview {
    ContentView()
        .environment(ChecklistData())
        .environment(ModelState())
}
