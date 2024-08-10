//
//  CustomButton.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import SwiftUI

struct CustomButton: View {
    let title: String
    let backgroundColor: Color
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundStyle(backgroundColor)
                
                Text(title)
                    .foregroundStyle(Color.white)
                    .bold()
            }
        }
        .padding()
    }
}

#Preview {
    CustomButton(title: "Button",
                 backgroundColor: .green) {
        print("action reaction")
    }
}
