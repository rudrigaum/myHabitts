//
//  SignInViewRouter.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 09/04/25.
//

import SwiftUI

enum SignInViewRouter {
    
    static func makeHomeView() -> some View {
        let viewModel = HomeViewModel()
        return HomeView(viewModel: viewModel)
    }
}
