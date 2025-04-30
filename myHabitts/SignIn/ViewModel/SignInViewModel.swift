//
//  SignInViewModel.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 25/03/25.
//

import SwiftUI
import Combine

class SignInViewModel: ObservableObject {
    
    private var cancellable: AnyCancellable?
    private var publisher = PassthroughSubject<Bool, Never>()
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var uiState: SignInUIState = .none
    
    init() {
        cancellable = publisher.sink { value in
            print("Usuário criado! goToHome: \(value)")
            
            if value {
                self.uiState = .success
            }
        }
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func login() {
        self.uiState = .loading
   
            
//            if let success = successResponse {
//                DispatchQueue.main.async {
//                    print(success)
//                    self.uiState = .success
//                }
//            }
        }
}

extension SignInViewModel {
    func homeView() -> some View {
        return SignInViewRouter.makeHomeView() 
    }
    
    func signUpView() -> some View {
        return SignInViewRouter.makeSignUpView(publisher: publisher)
    }
}
