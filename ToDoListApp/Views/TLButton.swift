//
//  TLButton.swift
//  ToDoList
//
//  Created by Анастасия Салапонова on 26.09.2023.
//

import SwiftUI

struct TLButton: View {//tl инициалы приложения для авторской кнопки
    let title: String
    let background: Color
    let action: () -> Void
    

    var body: some View {
        Button {
            //action
            action()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(Color.white)
                    .bold()
            }
            .padding()
        }

    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "Value", background: .pink){
            //action
        }
    }
}
