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
            
        case .Features:
            Text("Features")
//            ModelView(airframe: modelState.airframe!,
//                      models: modelState.models!)
            
        case .Checklists:
            Text("Checklists")
//            ChecklistsView(airframe: modelState.airframe!,
//                           model: modelState.model ?? "",
//                           checklists: modelState.checklists!)
            
        case .Checks:
            Text("Checks")
//            ChecksView(checklist: modelState.checklist!)
            
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
