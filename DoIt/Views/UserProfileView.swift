//
//  UserProfileView.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import SwiftUI

struct UserProfileView: View {
    @StateObject var viewModel = UserProfileViewModel()
    
    var body: some View {
        VStack {
            if let user = viewModel.user {
                profile(user: user)
            } else {
                Text("Loading Profile")
            }
        }
        .padding()
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(Color.green)
            .frame(width: 125,
                   height: 125)
            .padding()
        
        VStack(alignment: .leading) {
            Text("Name: \(user.name)")
                .padding()
            Text("E-Mail: \(user.email)")
                .padding()
            Text("Member since: \(user.created_at.formatted(date: .abbreviated, time: .shortened))")
                .padding()
            
            Button("Sign Out") {
                viewModel.signOut()
            }
            .tint(.red)
            .padding()
            
            Spacer()
        }
    }
}

#Preview {
    UserProfileView()
}
