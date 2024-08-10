//
//  ItemView.swift
//  DoIt
//
//  Created by BearyCode on 03.08.24.
//

import SwiftUI

struct ItemView: View {
    @StateObject var viewModel = ItemViewModel()
    
    let item: TaskItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                    .bold()
                
                Text("\(item.deadline.formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
            }
            Spacer()
            
            Button {
                viewModel.toggleDone(item: item)
            } label: {
                Image(systemName: item.done ? "circle.checkmark.fill" : "circle")
                    .foregroundStyle(Color.green)
            }
        }
    }
}

#Preview {
    ItemView(item: .init(id: "123",
                         title: "Get milk",
                         deadline: Date(),
                         created_at: Date(), 
                         done: false))
}
