//
//  AppError.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 16/05/25.
//

import Foundation

enum AppError: Error {
    case response(message: String)
    
    public var message: String {
        switch self {
        case .response(let message):
            return message
        }
    }
}
