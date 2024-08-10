//
//  DoItApp.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
import SwiftUI

@main
struct DoItApp: App {
    init() {
        FirebaseApp.configure()
    }
//    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
