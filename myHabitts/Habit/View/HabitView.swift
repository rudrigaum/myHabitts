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
                
                NavigationView {
                    
                    ScrollView(showsIndicators: false) {
                        VStack {
                            topContainer
                            addButton
                            
                            
                            if case HabitUIState.emptyList = viewModel.uiState {
                                
                                Spacer(minLength: 40)
                                
                                VStack {
                                    Image(systemName: "exclamationmark.octagon.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 24, height: 24, alignment: .center)
                                    
                                    Text("No habits found")
                                }
                                
                            } else if case HabitUIState.fullList(let rows) = viewModel.uiState {
                                LazyVStack {
                                    ForEach(rows, content: HabitCardView.init(viewModel:))
                                }.padding(.horizontal, 14)
                            } else if case HabitUIState.error = viewModel.uiState {
                                
                            }
                        }
                    }.navigationTitle("My Habits")
                }.onAppear {
                    viewModel.onAppear()
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
        VStack(alignment: .center, spacing: 12) {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50, alignment: .center)
            
            Text(viewModel.title)
                .font(Font.system(.title3).bold())
                .foregroundStyle(Color.orange)
            
            Text(viewModel.headline)
                .font(Font.system(.title3).bold())
                .foregroundStyle(Color.black)
            
            Text(viewModel.description)
                .font(Font.system(.subheadline))
                .foregroundStyle(Color.black)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 32)
        .overlay(
            RoundedRectangle(cornerRadius: 6)
                .stroke(Color.gray, lineWidth: 2)
        )
        .padding()
    }
}

extension HabitView {
    var addButton: some View {
        NavigationLink(destination: Text("Add screen")
            .frame(maxWidth: .infinity, maxHeight: .infinity )) {
                Label("Create Habit", systemImage: "plus.app")
                    .modifier(ButtonStyle())
                
        }
    }
}

#Preview {
    HomeViewRouter.makeHabitView()
}
