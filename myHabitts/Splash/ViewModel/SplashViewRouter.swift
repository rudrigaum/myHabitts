//
//  SplashViewRouter.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 28/03/25.
//

import SwiftUI

enum SplashViewRouter {
    
    static func makeSignInView() -> some View {
        let viewModel = SignInViewModel(interactor: SignInInteractor())
        return SignInView(viewModel: viewModel)
    }
    
}
