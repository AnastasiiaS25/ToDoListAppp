//
//  NewItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel: ObservableObject {
    @Published var title = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
  
    
    init() {}
    
    func save() {
        guard canSave else {
            return
        }
        
        //Get cirrent user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        //create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false)
        
        
        //save model
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())
    
        
    }
    
    var canSave: Bool{
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else { ///разобрать
            return false
        }
        return true
    }
}
