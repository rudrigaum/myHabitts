//
//  EditTextView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 14/04/25.
//

import SwiftUI

struct EditTextView: View {
    
    @Binding var text: String
    var placeholder: String = ""
    var keyboard: UIKeyboardType = .default
    var error: String? = nil
    var failure: Bool? = nil
    var isSecure: Bool = false
    
    var body: some View {
        VStack{
            if isSecure {
                SecureField(placeholder, text: $text)
                    .foregroundStyle(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            } else {
                TextField(placeholder, text: $text)
                    .foregroundStyle(Color("textColor"))
                    .keyboardType(keyboard)
                    .textFieldStyle(CustomTextFieldStyle())
            }
            
            if let error = error, failure == true, !text.isEmpty {
                Text(error).foregroundStyle(.red)
            }
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    VStack{
        
    EditTextView(text: .constant("Text"), placeholder: "E-mail", error: "Invalid field", failure: "a@a.com".count < 3)
            .padding()
    }
}
