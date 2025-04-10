//
//  Gender.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 10/04/25.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable {
    case male = "Male"
    case female = "Female"
    
    var id: String {
        self.rawValue
    }
}
