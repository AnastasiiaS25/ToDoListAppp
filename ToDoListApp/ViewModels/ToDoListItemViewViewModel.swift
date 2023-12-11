//
//  ToDoListItemViewViewModel.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

//viewModel for single to do list of items view(each row in items list)

class ToDoListItemViewViewModel: ObservableObject {
    init() {}
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(_state: !item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
}
