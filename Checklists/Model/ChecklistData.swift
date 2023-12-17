//
//
//  ChecklistData.swift
//  Checklists
//
//  Created by Logan Barnes on 12/14/23.
//

import Foundation

@Observable
class ChecklistData {
    var checklists: [Checklist] = load("checklistData.json")
    
    var allChecks: [ChecklistEntry] {
        checklists.reduce([ChecklistEntry]()) { entries, checklist in
            var entries = entries
            entries.append(contentsOf: checklist.checks)
            return entries
        }
    }
    
    var airframes: [String] {
        allChecks.reduce(Set<String>()) { airframes, entry in
            var airframes = airframes
            airframes.formUnion(entry.includedAirframes ?? [])
            airframes.formUnion(entry.excludedAirframes ?? [])
            return airframes
        }.sorted()
    }
    
    var airframeFeatures: [String: [String: Bool]] {
        allChecks.reduce([String: [String: Bool]]()) { features, entry in
            var features = features
            
            for airframe in airframes {
                if entry.feature != nil && entry.supportsAirframe(airframe: airframe) {
                    features[airframe, default: [String: Bool]()][entry.feature!] = false
                }
            }
            
            return features
        }
    }
    
    var airframeChecklists: [String: [Checklist]] {
        checklists.reduce([String: [Checklist]]()) { checklists, checklist in
            var checklists = checklists
            
            for airframe in airframes {
                if checklist.supportsAirframe(airframe: airframe) {
                    checklists[airframe, default: []].append(checklist)
                }
            }
            return checklists
        }
    }
}

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
