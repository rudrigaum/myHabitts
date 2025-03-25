//
//  myHabittsApp.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 12/03/25.
//

import SwiftUI

@main
struct myHabittsApp: App {
    var body: some Scene {
        WindowGroup {
            SplashView(viewModel: SplashViewModel())
        }
    }
}
