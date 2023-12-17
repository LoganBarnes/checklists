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
    var includedAirframes: [String]?
    var excludedAirframes: [String]?
    var feature: String?
    
    func supportsAirframe(airframe: String) -> Bool {
        let included = includedAirframes?.contains(airframe) ?? true
        let excluded = excludedAirframes?.contains(airframe) ?? false
        return included && !excluded
    }
    
    private enum CodingKeys: CodingKey {
        case check
        case response
        case includedAirframes
        case excludedAirframes
        case feature
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        check = try values.decode(String.self, forKey: .check)
        response = try values.decode(String.self, forKey: .response)
        includedAirframes = try? values.decode([String].self, forKey: .includedAirframes)
        excludedAirframes = try? values.decode([String].self, forKey: .excludedAirframes)
        feature = try? values.decode(String.self, forKey: .feature)
    }
}
