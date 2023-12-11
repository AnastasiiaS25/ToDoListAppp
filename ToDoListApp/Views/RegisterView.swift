//
//  RegisterView.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//

import SwiftUI

struct RegisterView: View {
   @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        VStack{
            //header
            HeaderView(title: "Register", subtitle: "Start organizing tods", angle: -15, background:.yellow)
            
            
            Form{
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                TextField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(
                    title: "Create Account ",
                    background: .green
                ){
                    viewModel.register()
                    //attempt registration
                }
                
                .padding()
            }
            .offset(y: -50)
            Spacer() //поднять елемент вверх если нужно поднять больше переходи в header
            
        }
    }
}


struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
