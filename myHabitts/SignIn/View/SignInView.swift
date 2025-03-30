//
//  SignInView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 25/03/25.
//

import SwiftUI

struct SignInView: View {
    
    @ObservedObject var viewModel: SignInViewModel
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SignInView(viewModel: SignInViewModel())
}
