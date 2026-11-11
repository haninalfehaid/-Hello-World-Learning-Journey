//
//  GoalFormView.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import SwiftUI

struct GoalFormView: View {
    @Bindable var viewModel: OnboardingViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 24) {
            VStack(alignment: .leading, spacing: 12) {
                Text("I want to learn")
                    .font(.title3)
                TextField("Swift", text: $viewModel.subject)
                    .textInputAutocapitalization(.words)
                Divider()
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("I want to learn it in a")
                    .font(.title3)
                HStack(spacing: 8) {
                    ForEach(LearningDuration.allCases) { duration in
                        durationButton(duration)
                    }
                }
            }
        }
    }

    @ViewBuilder
    private func durationButton(_ duration: LearningDuration) -> some View {
        if viewModel.duration == duration {
            Button(duration.rawValue) {
                viewModel.duration = duration
            }
            .buttonStyle(.glassProminent)
            .tint(Color.learningOrange)
        } else {
            Button(duration.rawValue) {
                viewModel.duration = duration
            }
            .buttonStyle(.glass)
        }
    }
}

#Preview {
    GoalFormView(viewModel: OnboardingViewModel())
        .padding()
        .preferredColorScheme(.dark)
}
