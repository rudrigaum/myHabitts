//
//  Date+Extension.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 22/07/25.
//

import Foundation

extension Date {
    
    func toString(destPattern dest: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = dest
        
        return formatter.string(from: self)
    }
}
