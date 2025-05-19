//
//  SignInInteractor.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 15/05/25.
//

import Foundation
import Combine

class SignInInteractor {
    
    private let remote: SignInRemoteDataSource = .shared
    
}


extension SignInInteractor {
    
    func login(loginRequest request: SignInRequest) -> Future<SignInResponse, AppError> {
        return remote.login(request: request)
    }
}
