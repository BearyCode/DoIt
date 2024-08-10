//
//  RegisterViewModel.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class RegisterViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userID = result?.user.uid else {
                return
            }
            
            self?.insertUserIntoDatebase(id: userID)
        }
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please fill all fields"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email"
            return false
        }
        
        guard password.count >= 8 else {
            errorMessage = "Please enter a longer password (min. 8 characters)"
            return false
        }
        
        return true
    }
    
    private func insertUserIntoDatebase(id: String) {
        let user = User(id: id,
                        name: name,
                        email: email,
                        created_at: Date.now)
        
        let db = Firestore.firestore()
        
        
        db.collection(Constants.users)
            .document(id)
            .setData([Constants.uid: user.id,
                      Constants.name: user.name,
                      Constants.email: user.email,
                      Constants.createdAt: Date()
                     ])
    }
}
