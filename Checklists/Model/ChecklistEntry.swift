//
//  ChecklistEntry.swift
//  Checklists
//
//  Created by Logan Barnes on 12/14/23.
//

import Foundation
import SwiftUI

struct ChecklistEntry: Hashable, Codable {
    var check: String
    var response: String
    var model: String
    var optional: Bool
}
