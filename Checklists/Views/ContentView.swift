//
//  ContentView.swift
//  Checklists
//
//  Created by Logan Barnes on 12/14/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(ChecklistData.self) var checklistData
    
    var body: some View {
        List{
            ForEach(checklistData.checklists) { checklist in
                HStack {
                    Text(checklist.checklistName)
                }
            }
        }
    }
}

#Preview {
    ContentView()
        .environment(ChecklistData())
}
