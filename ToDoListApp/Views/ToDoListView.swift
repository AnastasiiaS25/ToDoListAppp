//
//  ToDoListView.swift
//  ToDoListApp
//
//  Created by Анастасия Салапонова on 01.12.2023.
//

import FirebaseFirestoreSwift
import SwiftUI

struct ToDoListView: View {
    @StateObject var viewModel: ToDoListViewViewModel
     @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String){
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos")
        
        self._viewModel = StateObject(wrappedValue: ToDoListViewViewModel(userId: userId)
        )
    }
    
    
    var body: some View {
        NavigationView{
            VStack{
                List(items) { item in
                    ToDoListTeamView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)

                                
                            
                        }
                
                }
                .listStyle(PlainListStyle())
                
            }
            .navigationTitle("To Do List")
            .toolbar{
                Button {
                    //Action
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                }
                .sheet(isPresented: $viewModel.showingNewItemView) {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                }
                
            }
        }
    }
    
    
    struct ToDoListItemsView_Previews: PreviewProvider {
        static var previews: some View {
            ToDoListView(userId: "HAzGGaaJ26fjlYXfYoCa0KhHbAD2")
            //когда подключу базу то вставить сылку юзерс
        }
    }
    
}
