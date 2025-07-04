//
//  HabitCardView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 29/05/25.
//

import SwiftUI

struct HabitCardView: View {
    
    @State private var action = false
    
    let viewModel: HabitCardViewModel
    
    
    var body: some View {
        ZStack(alignment: .trailing) {
            NavigationLink(
                destination: Text("Destination"),
                isActive: self.$action,
                label: {
                    EmptyView()
                }
            )
            
            HStack {
                Image(systemName: "pencil")
                    .padding(.horizontal, 8)
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(viewModel.name)
                            .foregroundStyle(Color.orange)
                        
                        Text(viewModel.label)
                            .foregroundStyle(Color("textColor"))
                            .bold()
                        Text(viewModel.date)
                            .foregroundStyle(Color("textColor"))
                            .bold()
                    }
                }.frame(maxWidth: 300, alignment: .leading)
                    .padding()
                
                VStack(alignment: .leading, spacing: 4) {
                    
                    Text("Registred")
                        .foregroundStyle(Color.orange)
                        .bold()
                        .multilineTextAlignment(.leading)
                    
                    Text(viewModel.value)
                        .foregroundStyle(Color("textColor"))
                        .bold()
                        .multilineTextAlignment(.leading)
                    
                }.padding(.horizontal)
                Rectangle()
                    .frame(width: 8)
                    .foregroundStyle(viewModel.state)
                    .padding(.leading, 10)
            }
            .overlay(
                RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.gray, lineWidth: 2)
                    .shadow(color: .gray, radius: 2, x: 2.0, y: 2.0)
            )
        }
        .padding(.vertical, 8)
    }
}

#Preview {
    NavigationView {
        List {
            HabitCardView(viewModel: HabitCardViewModel(id: 1, icon: "https://via.placeholder.com/150", date: "01/01/2021", name: "Play Guitar", label: "hours", value: "2", state: .green))
            HabitCardView(viewModel: HabitCardViewModel(id: 1, icon: "https://via.placeholder.com/150", date: "01/01/2021", name: "Play Guitar", label: "hours", value: "2", state: .green))
            
        }
    }
}
