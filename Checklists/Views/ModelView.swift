//
//  ModelView.swift
//  Checklists
//
//  Created by Logan Barnes on 12/16/23.
//

import SwiftUI

struct ModelView: View {
    @Environment(ChecklistData.self) var checklistData
    @Environment(ModelState.self) var modelState
    
    var airframe: String
    var models: [String]
    
    var body: some View {
        VStack {
            Button {
                modelState.checklists  = nil
                modelState.airframe    = nil
                modelState.currentView = .Airframe
            } label: {
                HStack() {
                    Image(systemName: "chevron.backward")
                    Text("Airframes")
                    Spacer()
                }
                .padding()
            }
            
            Text("\(airframe) Model")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Select model")
                .font(.headline)
            
            ForEach(models, id:\.self) { model in
                Button {
                    modelState.model       = model
                    modelState.currentView = .Checklists
                } label: {
                    VStack {
                        AirframeImage(image: Image(model))
                        Text(model)
                            .font(.title)
                    }
                }.padding(40)
            }
        }
    }
}

#Preview {
    ModelView(airframe: "R44", models: ["Cadet", "Raven II"])
        .environment(ChecklistData())
        .environment(ModelState())
}
