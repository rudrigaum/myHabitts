//
//  SignInViewModel.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 25/03/25.
//

import Foundation

class SignInViewModel: ObservableObject {
    
    @Published var uiState: SignInUIState = .none
    
    func login(email: String, password: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.uiState = .goToHomeScreen
        }
    }
    
}
