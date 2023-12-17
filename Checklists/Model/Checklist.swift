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
    var title: String
    var group: String
    var includedAirframes: [String]?
    var excludedAirframes: [String]?
    var checks: [ChecklistEntry]
    
    private enum CodingKeys: CodingKey {
        case title
        case group
        case includedAirframes
        case excludedAirframes
        case checks
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: .title)
        group = try values.decode(String.self, forKey: .group)
        includedAirframes = try? values.decode([String].self, forKey: .includedAirframes)
        excludedAirframes = try? values.decode([String].self, forKey: .excludedAirframes)
        checks = try values.decode([ChecklistEntry].self, forKey: .checks)
    }
}
