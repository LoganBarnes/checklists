//
//  ChecksList.swift
//  Checklists
//
//  Created by Logan Barnes on 12/15/23.
//

import SwiftUI

struct ChecksList: View {
    var checklist: Checklist
    
    var body: some View {
        List{
            ForEach(checklist.checks) {check in
                HStack {
                    Text(check.check)
                    Spacer()
                    Text(check.response)
                }
            }
        }
    }
}

#Preview {
    ChecksList(checklist: ChecklistData().checklists[0])
}
