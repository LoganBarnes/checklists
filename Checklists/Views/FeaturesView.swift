//
//  FeaturesView.swift
//  Checklists
//
//  Created by Logan Barnes on 12/16/23.
//

import SwiftUI

import SwiftUI

struct FeaturesView: View {
    @Environment(ChecklistData.self) var checklistData
    @Environment(ModelState.self) var modelState
    
    var airframe: String
    var features: [String] {
        checklistData.allChecks.reduce([String]()) { features, check in
            var features = features
            if check.feature != nil && check.supportsAirframe(airframe: airframe) {
                features.append(check.feature!)
            }
            return features
        }
        .sorted()
    }
    
    var body: some View {
        VStack {
            Button {
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
            
            Text("Features")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Select installed features")
                .font(.headline)
            
            VStack(alignment: .listRowSeparatorLeading) {
                ForEach(features, id:\.self) { airframe in
                    HStack {
                        Text(airframe)
                            .font(.title)
                            .padding(10)
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundStyle(.green)
                    }
                    .padding()
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    FeaturesView(airframe: "R22")
        .environment(ChecklistData())
        .environment(ModelState())
}
