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
            loadingView()
        case .goToSignInScreen:
            Text("carregar tela de login")
        case .goToHomeScreen:
            Text("carregar tela principal")
        case .error(let msg):
            loadingView(error: msg)
        }
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
        }
    }
}

extension SplashView {
    var loading: some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
        }
    }
}

extension SplashView {
    func loadingView(error: String? = nil) -> some View {
        ZStack {
            Image("logo")
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
            
            if let error = error {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("myHabbits"), message: Text(error), dismissButton: .default(Text("Ok")){
                            
                        })
                    }
            }
        }
    }
}

#Preview {
    SplashView(state: .error("teste de erro no servidor"))
}
