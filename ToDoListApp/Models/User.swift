//
//  User.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//

import Foundation

struct User : Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}


