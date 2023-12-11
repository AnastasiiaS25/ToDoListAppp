//
//  ToDoListItem.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    
    mutating func setDone( _state: Bool) {
        isDone = _state
    }
}
