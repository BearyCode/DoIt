//
//  TaskItem.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import Foundation

struct TaskItem: Codable, Identifiable {
    let id: String
    let title: String
    let deadline: Date
    let created_at: Date
    var done: Bool
    
    mutating func setDone(_ state: Bool) {
        done = state
    }
}
