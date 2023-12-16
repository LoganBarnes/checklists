//
//  AirframeView.swift
//  Checklists
//
//  Created by Logan Barnes on 12/15/23.
//

import SwiftUI

struct AirframeView: View {
    @Environment(ChecklistData.self) var checklistData
    @Environment(ModelState.self) var modelState
    
    var body: some View {
        Grid {
            Text("Airframe")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Select airframe")
                .font(.headline)
            
            ForEach(checklistData.airframes, id:\.self) {airframe in
                let checklists = checklistData.airframeChecklists[airframe] ?? []
                
                Button {
                    modelState.airframe    = airframe
                    modelState.checklists  = checklists
                    modelState.currentView = .Checklists
                } label: {
                    VStack {
                        AirframeImage(image: Image(airframe))
                        Text(airframe)
                            .font(.title)
                    }
                }.padding(40)
            }
        }
    }
}

#Preview {
    AirframeView()
        .environment(ChecklistData())
        .environment(ModelState())
}
