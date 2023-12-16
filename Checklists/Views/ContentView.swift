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
            
        case .Checklists:
            ChecklistList(airframe: modelState.airframe!,
                          checklists: modelState.checklists!)
            
        case .Checks:
            ChecksList(checklist: modelState.checklist!)
            
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
