//
//  ModelState.swift
//  Checklists
//
//  Created by Logan Barnes on 12/16/23.
//

import Foundation

@Observable
class ModelState {
    var airframe: String? = nil
    var features: [String: Bool]? = nil
    var checklists: [Checklist]? = nil
    var checklist: Checklist? = nil
    var checks: [ChecklistEntry]? = nil
    var check: ChecklistEntry? = nil
    
    func goBack() {
        if check != nil {
            check = nil
            
        } else if checklist != nil {
            checks = nil
            checklist = nil
            
        } else if checklists != nil {
            checklists = nil
            
        } else if airframe != nil {
            features = nil
            airframe = nil
            
        }
    }
    
    func getPreviousView() -> String {
        if check != nil {
            return "\(checklist!.title)"
            
        } else if checklist != nil {
            return "\(airframe!) Checklists"
            
        } else if checklists != nil {
            return "\(airframe!) Features"
            
        } else if airframe != nil {
            return "Airframes"
            
        }
        return ""
    }
}
