//
//  ChecklistEntry.swift
//  Checklists
//
//  Created by Logan Barnes on 12/14/23.
//

import Foundation
import SwiftUI

struct ChecklistEntry: Hashable, Codable, Identifiable {
    let id = UUID()
    var check: String
    var response: String
    var model: String
    var optional: Bool
    
    private enum CodingKeys: CodingKey {
        case check
        case response
        case model
        case optional
    }
}
