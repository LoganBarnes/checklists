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
    @Binding var features: [String: Bool]
    
    var orderedFeatures: [String] {
        features.keys.sorted()
    }
    
    var body: some View {
        VStack {
            BackButton()
            
            Text("Features")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
            Text("Select installed features")
                .font(.headline)
            
            VStack {
                ForEach(orderedFeatures, id:\.self) { feature in
                    if let enabled = features[feature] {
                        let binding = Binding {
                            enabled
                        } set: {
                            features[feature] = $0
                        }
                        Toggle(feature, isOn: binding)
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .padding()
                    }
                }
            }
            
            Button {
                modelState.checklists = checklistData.airframeChecklists[airframe]
            } label: {
                Text("Continue")
                    .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                    .foregroundStyle(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                        .fill(Color.blue)
                        .shadow(radius: 3))
            }
            
            Spacer()
        }
    }
}

#Preview {
    @State var features = ["Feature 1": false, "Feat 2" : true ]
    
    return FeaturesView(airframe: "R22", features: $features)
        .environment(ChecklistData())
        .environment(ModelState())
}
