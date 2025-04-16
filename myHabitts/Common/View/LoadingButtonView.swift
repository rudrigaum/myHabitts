//
//  LoadingButtonView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 15/04/25.
//

import SwiftUI

struct LoadingButtonView: View {
    
    var action: () -> Void
    var text: String
    var disabled: Bool = false
    var showProgress: Bool = false
    
    var body: some View {
        ZStack{
        Button(action: {
            action()
        }, label:{
            Text(showProgress ? "": text)
                .frame(maxWidth: .infinity)
                .padding(.vertical, 14)
                .padding(.horizontal, 16)
                .font(Font.system(.title3).bold())
                .background(disabled ? Color("lightOrange") : Color.orange)
                .foregroundStyle(.white)
                .cornerRadius(4.0)
        }).disabled(disabled || showProgress)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle())
                .opacity(showProgress ? 1 : 0)
        }.padding()
    }
}

#Preview {
    LoadingButtonView(action: {
        print("Olá mundo")
    }, text: "Enter", disabled: false, showProgress: false)
}
