//
//  HomeViewRouter.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 21/05/25.
//

import Foundation
import SwiftUI

enum HomeViewRouter {
    
    static func makeHabitView() -> some View {
        let viewModel = HabitViewModel()
        return HabitView(viewModel: viewModel)
    }
}
