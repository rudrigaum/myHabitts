//
//  SignInErrorResponse.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 12/05/25.
//

import Foundation

struct SignInErrorResponse: Decodable {
    let detail: SignInDetailErrorResponse
    
    enum CodingKeys: String, CodingKey {
        case detail
    }
}
