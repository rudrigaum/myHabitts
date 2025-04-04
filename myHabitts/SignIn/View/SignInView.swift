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
        NavigationView {
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
}

extension SignInView {
    var emailTextField: some View {
        TextField("", text: $email)
            .border(Color.black)
    }
}

extension SignInView {
    var passwordTextField: some View {
        SecureField("", text: $password)
            .border(Color.black)
    }
}

extension SignInView {
    var loginButton: some View {
        Button("Enter") {
            //acontece o evento de click
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
                NavigationLink(
                    destination: Text("Register Screen"),
                    tag: 1,
                    selection: $action,
                    label: {EmptyView()})
                Button("Register") {
                    self.action = 1
                }
            }
        }
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel())
}
