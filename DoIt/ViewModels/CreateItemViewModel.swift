//
//  CreateItemViewModel.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class CreateItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var deadline = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        let db = Firestore.firestore()
        
        let id = UUID().uuidString
        let item = TaskItem(id: id,
                            title: title,
                            deadline: deadline,
                            created_at: Date(),
                            done: false)
        
        db.collection(Constants.users)
            .document(userID)
            .collection(Constants.tasks)
            .document(item.id)
            .setData([Constants.uuid: item.id,
                      Constants.title: item.title,
                      Constants.deadline: item.deadline,
                      Constants.createdAt: item.created_at,
                      Constants.done: item.done
                     ])
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard deadline >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
