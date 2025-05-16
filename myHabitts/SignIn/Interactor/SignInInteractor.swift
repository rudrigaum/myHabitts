//
//  SignInInteractor.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 15/05/25.
//

import Foundation

class SignInInteractor {
    
    private let remote: RemoteDataSource = .shared
    
}


extension SignInInteractor {
    
    func login(loginRequest request: SignInRequest, completion: @escaping (SignInResponse?, SignInErrorResponse?) -> Void) {
        remote.login(request: request, completion: completion)
    }
}
