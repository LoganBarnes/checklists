//
//  ChecklistsApp.swift
//  Checklists
//
//  Created by Logan Barnes on 12/14/23.
//

import SwiftUI

@main
struct ChecklistsApp: App {
    @State private var checklistData = ChecklistData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(checklistData)
        }
    }
}
