//
//  HabitViewModel.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 21/05/25.
//

import Foundation

class HabitViewModel: ObservableObject {
    
    
    @Published var uiState: HabitUIState = .emptyList
    
    @Published var title = "Alert"
    @Published var headline = "Stay alert!"
    @Published var description = "You are behind in habits"
    
    func onAppear() {
        self.uiState = .loading
        
        var rows: [HabitCardViewModel] = []
        
        rows.append(HabitCardViewModel(id: 1, icon: "https://via.placeholder.com/150", date: "01/01/2021", name: "Play Guitar", label: "hours", value: "2", state: .green))
        rows.append(HabitCardViewModel(id: 2, icon: "https://via.placeholder.com/150", date: "01/01/2021", name: "Play Guitar", label: "hours", value: "2", state: .green))
        rows.append(HabitCardViewModel(id: 3, icon: "https://via.placeholder.com/150", date: "01/01/2021", name: "Play Guitar", label: "hours", value: "2", state: .green))
        rows.append(HabitCardViewModel(id: 4, icon: "https://via.placeholder.com/150", date: "01/01/2021", name: "Play Guitar", label: "hours", value: "2", state: .green))
        rows.append(HabitCardViewModel(id: 5, icon: "https://via.placeholder.com/150", date: "01/01/2021", name: "Play Guitar", label: "hours", value: "2", state: .green))
        
        self.uiState = .fullList(rows)
                
        
    }
    
}
