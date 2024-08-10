//
//  ItemViewModel.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ItemViewModel: ObservableObject {
    init() {}
    
    func toggleDone(item: TaskItem) {
        var newItem = item
        newItem.setDone(!item.done)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection(Constants.users)
            .document(uid)
            .collection(Constants.tasks)
            .document(newItem.id)
            .setData([Constants.uuid: newItem.id,
                      Constants.title: newItem.title,
                      Constants.deadline: newItem.deadline,
                      Constants.createdAt: newItem.created_at,
                      Constants.done: newItem.done
                     ])
    }
}
