//
//  SignUpViewModel.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 10/04/25.
//

import SwiftUI

class SignUpViewModel: ObservableObject {
    
    @Published var uiState: SignUpUiState = .none
    
    func signUp() {
        self.uiState = .loading
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.uiState = .goToHomeScreen
        }
    }
    
}


extension SignUpViewModel {
    
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
    
}
