//
//  HabitUIState.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 25/05/25.
//

import Foundation

enum HabitUIState: Equatable {
    case loading
    case emptyList
    case fullList
    case error(String)
}
