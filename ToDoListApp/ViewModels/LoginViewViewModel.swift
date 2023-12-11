//
//  LoginViewViewModel.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMassage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        //try log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    private func validate() -> Bool {
        errorMassage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, //проверка для email
              !password.trimmingCharacters(in: .whitespaces).isEmpty else { //проверка для password
            errorMassage = "Please fill in all fields."
            return false
        }
        //условия для почты
        guard email.contains("@") && email.contains(".") else {
            errorMassage = "please enter valid email."               //для проверки что строки amail and password не пустые строки
            return false
        }
        return true
    }
  
}
    

 
