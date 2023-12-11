//
//  ProfileViewViewModel.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileViewViewModel: ObservableObject {
    init() {}
    @Published var user: User? = nil
    
    func fetchUser(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        let bd = Firestore.firestore()
        bd.collection("users").document(userId).getDocument(completion: {[weak self]snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  name: data["name"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0)
            }
            
                
        })
    }
    
    func logOut(){
        do{
            try Auth.auth().signOut()
            
        }catch {
            print(error)
        }
        
    }
}
    

