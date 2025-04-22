//
//  SignUpResponse.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 22/04/25.
//

import Foundation

struct SignUpResponse: Decodable {
    let detail: String?
    
    enum CodingKeys: String, CodingKey {
        case detail 
    }
}
