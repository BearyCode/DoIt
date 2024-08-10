//
//  LoginView.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HeaderView(title: "Do It! 🫵🏻",
                           subtitle: "Dont Wait!",
                           angle: 15,
                           backgroundColor: .green)
                
                Form {
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage)
                            .foregroundStyle(Color.red)
                    }
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    CustomButton(title: "Sign in", 
                                 backgroundColor: .green) {
                        viewModel.login()
                    }
                }
                
                VStack {
                    Text("No Account?")
                    
                    NavigationLink("Create an account", 
                                   destination: RegisterView())
                        .foregroundStyle(Color.green)
                    
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LoginView()
}
