//
//  CheckView.swift
//  Checklists
//
//  Created by Logan Barnes on 12/17/23.
//

import SwiftUI

struct CheckView: View {
    var check: ChecklistEntry
    
    var body: some View {
        VStack {
            BackButton()
            
            Spacer()
            
            Text(check.check)
            
            Spacer()
            
            Text(check.response)
            
            Spacer()
        }
    }
}

#Preview {
    CheckView(check: ChecklistData().allChecks[0])
        .environment(ModelState())
}
