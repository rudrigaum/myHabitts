//
//  CustomTextFieldStyle.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 14/04/25.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    public func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(.horizontal, 16)
            .padding(.vertical, 16)
            .overlay(
                RoundedRectangle(cornerRadius: 8.0)
                    .stroke(Color.orange, lineWidth: 0.8)
            )
    }
    
    
}
