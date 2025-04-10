//
//  SignUpView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 09/04/25.
//

import SwiftUI

struct SignUpView: View {
    
    @State var fullName = ""
    @State var email = ""
    @State var password = ""
    @State var document = ""
    @State var phone = ""
    @State var birthday = ""
    
    
    var body: some View {
        ZStack{
            ScrollView(showsIndicators: false) {
                VStack(alignment: .center){
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Register")
                            .foregroundStyle(.black)
                            .font(Font.system(.title).bold())
                            .padding()
                        fullNameTextField
                        emailTextField
                        passwordTextField
                        documentTextField
                        phoneTextField
                        birthdayTextField
                        registerButton
                    }
                    Spacer()
                }.padding(.horizontal, 8)
            }.padding()
        }
    }
}


extension SignUpView {
    var fullNameTextField: some View {
        TextField("", text: $fullName)
            .border(Color.black)
    }
}
extension SignUpView {
    var emailTextField: some View {
        TextField("", text: $email)
            .border(Color.black)
    }
}

extension SignUpView {
    var passwordTextField: some View {
        SecureField("", text: $password)
            .border(Color.black)
    }
}

extension SignUpView {
    var documentTextField: some View {
        SecureField("", text: $document)
            .border(Color.black)
    }
}

extension SignUpView {
    var phoneTextField: some View {
        SecureField("", text: $phone)
            .border(Color.black)
    }
}

extension SignUpView {
    var birthdayTextField: some View {
        SecureField("", text: $birthday)
            .border(Color.black)
    }
}


extension SignUpView {
    var registerButton: some View {
        Button("Register") {
        }
    }
}
    

#Preview {
    SignUpView()
}
