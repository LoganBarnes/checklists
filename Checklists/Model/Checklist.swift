//
//  SwiftUIView.swift
//  Checklists
//
//  Created by Logan Barnes on 12/14/23.
//

import Foundation
import SwiftUI

struct Checklist: Hashable, Codable, Identifiable {
    var id: Int
    var airframe: String
    var checklistName: String
    var group: String
//    var checks: [ChecklistEntry]
}
