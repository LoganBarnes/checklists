//
//  AirframeView.swift
//  Checklists
//
//  Created by Logan Barnes on 12/15/23.
//

import SwiftUI

struct AirframeView: View {
    @Environment(ChecklistData.self) var checklistData
    
    var body: some View {
        NavigationView {
            Grid {
                Divider()
                
                ForEach(checklistData.airframes, id:\.self) {airframe in
                    let checklists = checklistData.airframeChecklists[airframe] ?? []
                    
                    GridRow {
                        NavigationLink {
                            ChecklistList(checklists: checklists)
                        } label: {
                            Text(airframe)
                                .font(.title)
                        }
                    }.padding(40)
                    Divider()
                }
            }
        }
        .navigationTitle("Airframes")
    }
}

#Preview {
    AirframeView()
        .environment(ChecklistData())
}
