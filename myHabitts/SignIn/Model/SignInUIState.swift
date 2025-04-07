//
//  SignInUIState.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 07/04/25.
//

import Foundation

enum SignInUIState {
    case none
    case loading
    case goToHomeScreen
    case error(String)
}
