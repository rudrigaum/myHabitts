//
//  SignInView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 25/03/25.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    @State var action: Int? = 0
    @State var navigationHidden = true
    
    var body: some View {
        ZStack {
            if case SignInUIState.goToHomeScreen = viewModel.uiState {
                HabitView(viewModel: HabitViewModel())
            } else {
                NavigationStack {
                    ScrollView(showsIndicators: false) {
                        VStack(alignment: .center, spacing: 20) {
                            Spacer(minLength: 36)
                            VStack(alignment: .center, spacing: 8) {
                                Image("logo")
                                    .resizable()
                                    .scaledToFit()
                                Text("Login")
                                    .foregroundStyle(.orange)
                                    .font(Font.system(.title).bold())
                                    .padding(.bottom, 8)
                                
                                emailTextField
                                passwordTextField
                                loginButton
                                registerButton
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .padding(.horizontal, 32)
                    .navigationBarTitle("Login", displayMode: .inline)
                    .navigationBarHidden(true)
                }
            }
            if case SignInUIState.error(let value) = viewModel.uiState {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")) {
                    })
                }
            }
        }
      
    }
}

extension SignInView {
    var emailTextField: some View {
        EditTextView(text: $viewModel.email,
                     placeholder: "e-mail",
                     keyboard: .emailAddress,
                     error: "invalid e-mail",
                     failure: !viewModel.email.isEmail())
    }
}

extension SignInView {
    var passwordTextField: some View {
        EditTextView(text: $viewModel.password,
                      placeholder: "password",
                      keyboard: .emailAddress,
                      error: "password must be at least 8 characters",
                      failure: viewModel.password.count < 8,
                      isSecure: true)
    }
}

extension SignInView {
    var loginButton: some View {
        LoadingButtonView(action: {
            viewModel.login()
        },
        text: "Enter",
                          disabled: !viewModel.email.isEmail() || viewModel.password.count < 8,
        showProgress: self.viewModel.uiState == SignInUIState.loading)
    }
}

extension SignInView {
    var registerButton: some View {
        VStack {
            Text("Don't have an active login yet?")
                .foregroundColor(.gray)
                .padding(.top, 48)
            ZStack {
                NavigationLink {
                    viewModel.signUpView()
                } label: {
                    Text("Register")
                }
            }
        }
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel(interactor: SignInInteractor()))
}
