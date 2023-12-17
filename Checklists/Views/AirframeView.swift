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
        VStack {
            Text("Airframe")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Select airframe")
                .font(.headline)
            
            VStack(alignment: .listRowSeparatorLeading) {
                ForEach(checklistData.airframes, id:\.self) { airframe in
                    Button {
                        modelState.airframe = airframe
                        modelState.features = checklistData.airframeFeatures[airframe]!
                    } label: {
                        AirframeImage(image: Image(airframe))
                        Text(airframe)
                            .font(.title)
                            .padding(10)
                        
                    }.padding(10)
                }
            }
            .padding()
        }
    }
}

#Preview {
    AirframeView()
        .environment(ChecklistData())
        .environment(ModelState())
}
