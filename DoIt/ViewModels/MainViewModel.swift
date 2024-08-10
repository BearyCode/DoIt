//
//  MainViewModel.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {
    @Published var currenUserId = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            DispatchQueue.main.async {
                self?.currenUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

