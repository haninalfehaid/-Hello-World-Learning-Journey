//
//  GoalEndView.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import SwiftUI

struct GoalEndView: View {
    let isCompleted: Bool
    var activityViewModel: ActivityViewModel

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: isCompleted ? "hands.clap.fill" : "xmark.seal.fill")
                .font(.system(size: 44))
                .foregroundStyle(Color.learningOrange)
                .padding(.bottom, 8)

            Text(isCompleted ? "Well done!" : "You didn't reach your goal this time.")
                .font(.headline)

            Text(isCompleted ? "Ready for your next goal?" : "Want to set another goal?")
                .font(.subheadline)
                .foregroundStyle(.secondary)

            NavigationLink {
                LearningGoalView(activityViewModel: activityViewModel)
            } label: {
                Label("Set a goal", systemImage: "pencil.and.outline")
            }
            .buttonStyle(.glassProminent)
            .tint(Color.learningOrange)
            .padding(.top, 24)
        }
        .multilineTextAlignment(.center)
    }
}

#Preview {
    NavigationStack {
        VStack(spacing: 80) {
            GoalEndView(isCompleted: true, activityViewModel: ActivityViewModel())
            GoalEndView(isCompleted: false, activityViewModel: ActivityViewModel())
        }
    }
    .preferredColorScheme(.dark)
}
