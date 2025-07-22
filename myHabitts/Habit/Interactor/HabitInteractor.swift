//
//  HabitInteractor.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 04/07/25.
//

import Foundation
import Combine

class HabitInteractor {
    
    private let remote: HabitRemoteDataSource = .shared
}


extension HabitInteractor {
    
    func fecthHabits() -> Future<[HabitResponse], AppError> {
        return remote.fetchHabits()
    }
}
