//
//  RefreshRequest.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 20/05/25.
//

import Foundation

struct RefreshRequest: Encodable {
    
    let refreshToken: String
    
    enum CodingKeys: String, CodingKey {
        case refreshToken = "refresh_token"
    }
}
