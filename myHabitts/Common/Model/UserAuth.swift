//
//  UserAuth.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 20/05/25.
//

import Foundation

struct UserAuth: Codable {
    var idToken: String
    var refreshToken: String
    var expires: Int = 0
    var tokenType: String
    
    enum CodingKeys: String, CodingKey {
        case idToken = "access_token"
        case refreshToken = "refresh_token"
        case expires
        case tokenType = "token_type"
    }
    
}
