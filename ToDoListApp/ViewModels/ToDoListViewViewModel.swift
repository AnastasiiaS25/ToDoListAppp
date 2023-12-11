//
//  ToDoListViewViewModel.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//
import FirebaseFirestore
import Foundation



class ToDoListViewViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    ///Delete to do item
    /// - Parameter id: IItem id to delete
    
    func delete(id: String){
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    }

}


