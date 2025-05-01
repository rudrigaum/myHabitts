//
//  SignUpViewModel.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 10/04/25.
//

import SwiftUI
import Combine

class SignUpViewModel: ObservableObject {
    
    @Published var fullName = ""
    @Published var email = ""
    @Published var password = ""
    @Published var document = ""
    @Published var phone = ""
    @Published var birthday = ""
    @Published var gender = Gender.male
    
    var publisher: PassthroughSubject<Bool, Never>!
    
    @Published var uiState: SignUpUiState = .none
    
    func signUp() {
        self.uiState = .loading
        
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "dd/MM/yyyy"
        
        let dateFormatted = formatter.date(from: birthday)
        
        guard let dateFormatted = dateFormatted else {
            self.uiState = .error("Invalid date \(birthday)")
            return
        }
        
        formatter.dateFormat = "yyyy-MM-dd"
        
        let birthday = formatter.string(from: dateFormatted)
        
        WebService.postUser(request: SignUpRequest(fullName: fullName, email: email, password: password, document: document, phone: phone, birthday: birthday, gender: gender.index)) {(successResponse, errorResponse) in
            
            if let error = errorResponse {
                DispatchQueue.main.async {
                    self.uiState = .error(error.detail)
                }
            }
            
            if let success = successResponse {
                DispatchQueue.main.async {
                    self.publisher.send(success)
                    if success {
                        self.uiState = .success
                    }
                }
            }
        }
    }
    
}


extension SignUpViewModel {
    
    func homeView() -> some View {
        return SignUpViewRouter.makeHomeView()
    }
    
}
