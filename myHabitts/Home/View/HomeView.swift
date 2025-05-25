//
//  HomeView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 09/04/25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            viewModel.habitView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Habits")
                }.tag(0)
            
            Text("Graphics \(selection)")
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Graphics")
                }.tag(1)
            
            Text("Profile \(selection)")
                .tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("Profile")
                }.tag(2)
        }
        .background(Color.white)
        .accentColor(Color.teal)
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
