//
//  BackButton.swift
//  Checklists
//
//  Created by Logan Barnes on 12/16/23.
//

import SwiftUI

struct BackButton: View {
    @Environment(ModelState.self) var modelState
    
    var body: some View {
        Button {
            modelState.goBack()
        } label: {
            HStack() {
                Image(systemName: "chevron.backward")
                Text(modelState.getPreviousView())
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    BackButton()
        .environment(ModelState())
}
