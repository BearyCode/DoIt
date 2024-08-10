//
//  ListItemsView.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import FirebaseFirestore
import SwiftUI

struct ListItemsView: View {
    @StateObject var viewModel: ListItemsViewModel
    @FirestoreQuery var items: [TaskItem]
    
    
    
    init(userID: String) {
        self._items = FirestoreQuery(collectionPath: "/\(Constants.users)/\(userID)/\(Constants.tasks)")
        self._viewModel = StateObject(wrappedValue: ListItemsViewModel(userID: userID))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    ItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Tasks")
            .toolbar {
                Button {
                    viewModel.showingUserProfileView = true
                } label: {
                    Image(systemName: "person")
                        .tint(.green)
                }
                
                Button {
                    viewModel.showingCreateItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundStyle(Color.green)
                }
            }
            .sheet(isPresented: $viewModel.showingCreateItemView) {
                CreateItemView(createItemPresented: $viewModel.showingCreateItemView)
            }
            .sheet(isPresented: $viewModel.showingUserProfileView) {
                UserProfileView()
            }
        }
        .onAppear {
            print(items.count)
        }
    }
}

#Preview {
    ListItemsView(userID: "KCLldTtieZTbgFUagebjhAFkO5s1")
}
