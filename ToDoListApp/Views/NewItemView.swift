//
//  NewItemView.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//
import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        VStack{
            Text("New Item")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form{
                //title
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                //dATE
                DatePicker("DueDate", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                //BUTTON
                TLButton(title: "Save" ,
                         background: .pink
                ){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                .padding()
                
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text ("Please fill in all fields and select due date that is today or newer"))
            }
        }
    }
    
    
    struct NewTeamView_Previews: PreviewProvider {
        static var previews: some View {
            NewItemView(newItemPresented: Binding(get: {
                return true
            }, set: { _ in
                
            }))
        }
    }
}
