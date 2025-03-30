//
//  SplashViewModel.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 21/03/25.
//

import SwiftUI

class SplashViewModel: ObservableObject {
    
    @Published var uiState: SplashUIState = .loading
    
    func onAppear() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.uiState = .goToSignInScreen
        }
    }
    
}

extension SplashViewModel {
    
    func signInView() -> some View {
        return SplashViewRouter.makeSignInView()
    }
}
