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
    
    var airframeChecklists: [String : [Checklist]] {
        checklists.reduce([String : [Checklist]]()) { dict, checklist in
            var dict = dict
            dict[checklist.airframe, default: []].append(checklist)
            return dict
        }
    }
    
    var airframes: [String] {
        airframeChecklists.map { airframe, _ in
            return airframe
        }.sorted()
    }
    
    var airframeModels: [String : [String]] {
        airframeChecklists.mapValues { checklists in
            checklists.reduce([String]()) { models, checklist in
                var models = models
                for check in checklist.checks {
                    if check.model != "all" && !models.contains(check.model)
                    {
                        models.append(check.model)
                    }
                }
                return models
            }.sorted()
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
