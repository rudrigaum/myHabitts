//
//  SignInUIState.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 07/04/25.
//

import Foundation

enum SignInUIState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
