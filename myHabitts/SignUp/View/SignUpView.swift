//
//  SignUpView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 09/04/25.
//

import SwiftUI

struct SignUpView: View {
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center){
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Register")
                            .foregroundStyle(Color("textColor"))
                            .font(Font.system(.title).bold())
                            .padding()
                        fullNameTextField
                        emailTextField
                        passwordTextField
                        documentTextField
                        phoneTextField
                        birthdayTextField
                        genderField
                        registerButton
                    }
                    Spacer()
                }.padding(.horizontal, 8)
            }.padding()
            
            if case SignUpUiState.error(let value) = viewModel.uiState {
                Text("")
                    .alert(isPresented: .constant(true)) {
                        Alert(title: Text("Habit"), message: Text(value), dismissButton: .default(Text("Ok")) {
                            
                        })
                    }

            }
        }
    }
}


extension SignUpView {
    var fullNameTextField: some View {
        EditTextView(text: $viewModel.fullName,
                     placeholder: "full name",
                     keyboard: .alphabet,
                     error: "invalid full name",
                     failure: viewModel.fullName.count < 3)
    }
}
extension SignUpView {
    var emailTextField: some View {
        EditTextView(text: $viewModel.email,
                     placeholder: "e-mail",
                     keyboard: .emailAddress,
                     error: "invalid e-mail",
                     failure: !viewModel.email.isEmail())
    }
}

extension SignUpView {
    var passwordTextField: some View {
        EditTextView(text: $viewModel.password,
                      placeholder: "password",
                      keyboard: .emailAddress,
                      error: "password must be at least 8 characters",
                      failure: viewModel.password.count < 8,
                      isSecure: true)
    }
}

extension SignUpView {
    var documentTextField: some View {
        EditTextView(text: $viewModel.document,
                     placeholder: "cpf",
                     keyboard: .numberPad,
                     error: "invalid cpf",
                     failure: viewModel.document.count != 11)
    }
}

extension SignUpView {
    var phoneTextField: some View {
        EditTextView(text: $viewModel.phone,
                     placeholder: "phone",
                     keyboard: .numberPad,
                     error: "invalid phone",
                     failure: viewModel.phone.count < 10 || viewModel.phone.count >= 12)
    }
}

extension SignUpView {
    var birthdayTextField: some View {
        EditTextView(text: $viewModel.birthday,
                     placeholder: "birthday",
                     keyboard: .numberPad,
                     error: "invalid birthday",
                     failure: viewModel.birthday.count != 10)
    }
}

extension SignUpView {
    var genderField: some View {
        Picker("Gender", selection: $viewModel.gender) {
            ForEach(Gender.allCases, id: \.self) { value in
                Text(value.rawValue)
                    .tag(value)
            }
        }.pickerStyle(SegmentedPickerStyle())
            .padding(.top, 16)
            .padding(.bottom, 16)
    }
}

extension SignUpView {
    var registerButton: some View {
        LoadingButtonView(action: {
            viewModel.signUp()
        },
        text: "Register",
                          disabled: !viewModel.email.isEmail() || viewModel.password.count < 8 || viewModel.fullName.count < 3 || viewModel.document.count != 11 || viewModel.phone.count < 10 || viewModel.phone.count >= 12 || viewModel.birthday.count != 10,
        showProgress: self.viewModel.uiState == SignUpUiState.loading)
    }
}
    

#Preview {
    SignUpView(viewModel: SignUpViewModel())
}
