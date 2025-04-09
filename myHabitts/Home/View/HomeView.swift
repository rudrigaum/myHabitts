//
//  HomeView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 09/04/25.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: HomeViewModel 
    
    var body: some View {
        Text("Olá home page")
    }
}

#Preview {
    HomeView(viewModel: HomeViewModel())
}
