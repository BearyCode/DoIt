//
//  RegisterView.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import SwiftUI

struct RegisterView: View {
    @State var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            HeaderView(title: "Register",
                       subtitle: "Create your account",
                       angle: -15,
                       backgroundColor: .blue)
            
            Form {
                TextField("Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                
                TextField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                CustomButton(title: "Sign up",
                             backgroundColor: .blue) {
                    
                    viewModel.register()
                }
            }
            
            Spacer()
        }
    }
}

#Preview {
    RegisterView()
}
