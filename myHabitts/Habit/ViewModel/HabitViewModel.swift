//
//  HabitViewModel.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 21/05/25.
//

import Foundation

class HabitViewModel: ObservableObject {
    
    
    @Published var uiState: HabitUIState = .emptyList
}
