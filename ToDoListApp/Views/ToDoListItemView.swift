//
//  ToDoListItemView.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//
import SwiftUI

struct ToDoListTeamView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()

    let item: ToDoListItem
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
            }
            Spacer()
            
            
            Button{
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(Color.blue)
            }
        }
    }
}

struct ToDoListTeamView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListTeamView(item: .init(id: "123",
                                     title: "Get milk",
                                     dueDate:
                                        Date().timeIntervalSince1970, createdDate: Date() .timeIntervalSince1970,
                                     isDone: true
                                    ))
    }
}
