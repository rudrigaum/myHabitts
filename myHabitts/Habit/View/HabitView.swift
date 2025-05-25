//
//  HabitView.swift
//  myHabitts
//
//  Created by Rodrigo Cerqueira Reis on 21/05/25.
//

import SwiftUI

struct HabitView: View {
    
    @ObservedObject var viewModel: HabitViewModel
    
    var body: some View {
        ZStack {
            if case HabitUIState.loading = viewModel.uiState {
                progress
            } else {
                
                ScrollView(showsIndicators: false) {
                    VStack {
                        topContainer
                        
                        
                        if case HabitUIState.emptyList = viewModel.uiState {
                            
                        } else if case HabitUIState.fullList = viewModel.uiState {
                            
                        } else if case HabitUIState.error = viewModel.uiState {
                            
                        }
                    }
                }
            }
        }
    }
}

extension HabitView {
    var progress: some View {
        ProgressView()
    }
}

extension HabitView {
    var topContainer: some View {
        
    }
}

#Preview {
    HomeViewRouter.makeHabitView()
}
