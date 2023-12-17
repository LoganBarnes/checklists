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
    
    var airframes = [ "R22", "R44 Cadet", "R44 Raven II", "R66" ]
    
    var allChecks: [ChecklistEntry] {
        checklists.reduce([ChecklistEntry]()) { entries, checklist in
            var entries = entries
            entries.append(contentsOf: checklist.checks)
            return entries
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
