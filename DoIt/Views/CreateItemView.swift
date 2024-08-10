//
//  CreateItemView.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import SwiftUI

struct CreateItemView: View {
    @StateObject var viewModel = CreateItemViewModel()
    @Binding var createItemPresented: Bool
    
    var body: some View {
        VStack {
            Text("New Task")
                .font(.system(size: 32))
                .bold()
                .padding(.top, 100)
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Deadline", selection: $viewModel.deadline)
                
                CustomButton(title: "Save", 
                             backgroundColor: .green) {
                    if viewModel.canSave {
                        viewModel.save()
                        createItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                }
                             .padding()
            }
            .alert(isPresented: $viewModel.showAlert) {
                Alert(title: Text("Error"),
                      message: Text("Please check your input"))
            }
        }
    }
}

#Preview {
    CreateItemView(createItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
