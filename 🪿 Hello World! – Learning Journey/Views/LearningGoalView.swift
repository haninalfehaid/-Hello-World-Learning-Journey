//
//  LearningGoalView.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import SwiftUI

struct LearningGoalView: View {
    var activityViewModel: ActivityViewModel
    @State private var viewModel: OnboardingViewModel
    @State private var showUpdateAlert = false
    @Environment(\.dismiss) private var dismiss

    init(activityViewModel: ActivityViewModel) {
        self.activityViewModel = activityViewModel
        _viewModel = State(initialValue: OnboardingViewModel(goal: activityViewModel.progress?.goal))
    }

    var body: some View {
        VStack {
            GoalFormView(viewModel: viewModel)
            Spacer()
        }
        .padding(.horizontal, 16)
        .padding(.top, 24)
        .navigationTitle("Learning Goal")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {
                    showUpdateAlert = true
                } label: {
                    Image(systemName: "checkmark")
                }
                .buttonStyle(.glassProminent)
                .tint(Color.learningOrange)
                .disabled(!canSave)
            }
        }
        .overlay {
            if showUpdateAlert {
                UpdateGoalAlertView(
                    onDismiss: { showUpdateAlert = false },
                    onUpdate: {
                        activityViewModel.startGoal(viewModel.makeGoal())
                        dismiss()
                    }
                )
            }
        }
        .preferredColorScheme(.dark)
    }

    private var canSave: Bool {
        guard let goal = activityViewModel.progress?.goal else { return false }
        let goalEnded = activityViewModel.isGoalCompleted || activityViewModel.isStreakBroken
        return viewModel.canStart && (viewModel.hasChanges(from: goal) || goalEnded)
    }
}

#Preview {
    let viewModel = ActivityViewModel()
    viewModel.startGoal(LearningGoal(subject: "Swift", duration: .week, startDate: Date()))
    return NavigationStack {
        LearningGoalView(activityViewModel: viewModel)
    }
}
