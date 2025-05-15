//
//  SignInDetailErrorResponse.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 12/05/25.
//

import Foundation

struct SignInDetailErrorResponse: Decodable {
    
    let message: String
    	
    enum CodingKeys: String, CodingKey {
        case message
    }
 
    
}
