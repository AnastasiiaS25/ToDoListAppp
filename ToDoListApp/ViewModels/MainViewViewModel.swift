//
//  MainViewViewModel.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//

import FirebaseAuth
import Foundation

class MainViewViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self .handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currentUserId = user?.uid ?? ""
                
            }
        
        }
    }
    
    public var issignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
