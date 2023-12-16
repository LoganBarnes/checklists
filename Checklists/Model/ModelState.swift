//
//  ModelState.swift
//  Checklists
//
//  Created by Logan Barnes on 12/16/23.
//

import Foundation

@Observable
class ModelState {
    enum CurrentView {
        case Airframe
        case Models
        case Checklists
        case Checks
        case CheckEntry
    }
    
    var currentView: CurrentView = .Airframe
    
    var airframe: String? = nil
    var models: [String]? = nil
    var model: String? = nil
    var checklists: [Checklist]? = nil
    var checklist: Checklist? = nil
    var check: ChecklistEntry? = nil
}
