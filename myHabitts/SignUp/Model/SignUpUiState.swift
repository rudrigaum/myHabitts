//
//  SignUpUiState.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 10/04/25.
//

import Foundation

enum SignUpUiState: Equatable {
    case none
    case loading
    case success
    case error(String)
}
