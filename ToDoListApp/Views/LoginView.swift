//
//  LoginView.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView{
            VStack{
                //header
                HeaderView(title: "To Do List", subtitle: "Get things done", angle: 15, background:.blue)
                
                
                
                
                //login form
                
                Form{
                    if !viewModel.errorMassage.isEmpty{
                        Text(viewModel.errorMassage)
                            .foregroundColor(Color.red)
                        
                    }
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle()) //стиль иконки регистрации без ободка
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())//по умолчанию было RoundedBorderTextFieldStyle
                    
                    TLButton(
                        title: "Log In ",
                        background: .blue
                    ){
                        viewModel.login()
                        //attempt log  in
                    }
                    .padding() // отступ
                }
                .offset(y: -50)
                
                //create account
                VStack{
                    Text("New around here")
                    
                    //show registration
                    
                    NavigationLink("Create An Account", destination: RegisterView()) //появилась рабочая кнопка создать аккаунт
                }
                .padding(.bottom, 50)
                Spacer()
                
            }
        }
    }
    
    struct LoginView_Previews: PreviewProvider {
        static var previews: some View {
            LoginView()
        }
    }
}
