//
//  ListItemsViewModel.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import FirebaseFirestore
import Foundation

class ListItemsViewModel: ObservableObject {
    @Published var showingCreateItemView = false
    @Published var showingUserProfileView = false
    
    private let userID: String
    
    init(userID: String) {
        self.userID = userID
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection(Constants.users)
            .document(userID)
            .collection(Constants.tasks)
            .document(id)
            .delete()
    }
}
