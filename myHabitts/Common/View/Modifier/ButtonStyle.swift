//
//  ButtonStyle.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 29/05/25.
//

import Foundation
import SwiftUI

struct ButtonStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 14)
            .padding(.horizontal, 16)
            .font(Font.system(.title3).bold())
            .background(Color.orange)
            .foregroundColor(.white)
            .cornerRadius(4)
    }
}
