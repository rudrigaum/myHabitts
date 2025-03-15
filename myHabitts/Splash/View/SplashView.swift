//
//  SplashView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 15/03/25.
//

import SwiftUI

struct SplashView: View {
    
    @State var state: SplashUIState = .goToSignInScreen
    
    var body: some View {
        switch state {
        case .loading:
            Text("Loading")
        case .goToSignInScreen:
            Text("carregar tela de login")
        case .goToHomeScreen:
            Text("carregar tela principal")
        case .error(let msg):
            Text("mostrar erro: \(msg)")
        }
    }
}

#Preview {
    SplashView(state: .error("erro no servidor"))
}
