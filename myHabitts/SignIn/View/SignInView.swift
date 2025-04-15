//
//  SignInView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 25/03/25.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    @State var email = ""
    @State var password = ""
    @State var action: Int? = 0
    @State var navigationHidden = true
    
    var body: some View {
        ZStack {
            if case SignInUIState.success = viewModel.uiState {
                Text("Tela principal")
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
        EditTextView(text: $email,
                     placeholder: "e-mail",
                     keyboard: .emailAddress,
                     error: "invalid e-mail",
                     failure: !email.isEmail())
    }
}

extension SignInView {
    var passwordTextField: some View {
        EditTextView(text: $password,
                      placeholder: "password",
                      keyboard: .emailAddress,
                      error: "password must be at least 8 characters",
                      failure: password.count < 8,
                      isSecure: true)
    }
}

extension SignInView {
    var loginButton: some View {
        Button("Enter") {
            viewModel.login(email: email, password: password)
        }
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
    SignInView(viewModel: SignInViewModel())
}
