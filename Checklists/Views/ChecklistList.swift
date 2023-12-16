//
//  ChecklistList.swift
//  Checklists
//
//  Created by Logan Barnes on 12/15/23.
//

import SwiftUI

struct ChecklistList: View {
    var checklists: [Checklist]
    
    var body: some View {
        NavigationView{
            List{
                ForEach(checklists, id: \.checklistName) {checklist in
                    NavigationLink{
                        ChecksList(checklist: checklist)
                    } label: {
                        Text(checklist.checklistName)
                    }
                }
            }
            .navigationTitle("Checklists")
        }
    }
}

#Preview {
    ChecklistList(checklists: ChecklistData().checklists)
}
