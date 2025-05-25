//
//  HomeViewModel.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 09/04/25.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    
}
 
extension HomeViewModel {
    func habitView() -> some View {
        return HomeViewRouter.makeHabitView()
    }
}
