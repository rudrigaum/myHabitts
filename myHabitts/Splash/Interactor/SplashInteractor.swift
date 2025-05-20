//
//  SplashInteractor.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 20/05/25.
//

import Foundation
import Combine

class SplashInteractor {
    
    private let local: LocalDataSource = .shared
}

extension SplashInteractor {
    
    func fecthAuth() -> Future<UserAuth?, Never> {
        return local.getUserAuth()
    }
}
