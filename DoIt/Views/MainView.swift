//
//  MainView.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currenUserId.isEmpty {
            ListItemsView(userID: viewModel.currenUserId)
        } else {
            LoginView()
        }
    }
}

#Preview {
    MainView()
}
