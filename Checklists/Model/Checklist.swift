//
//  SwiftUIView.swift
//  Checklists
//
//  Created by Logan Barnes on 12/14/23.
//

import Foundation
import SwiftUI

struct Checklist: Hashable, Codable, Identifiable {
    let id = UUID()
    var airframe: String
    var checklistName: String
    var group: String
    var checks: [ChecklistEntry]
    
    private enum CodingKeys: CodingKey {
        case airframe
        case checklistName
        case group
        case checks
    }
}
