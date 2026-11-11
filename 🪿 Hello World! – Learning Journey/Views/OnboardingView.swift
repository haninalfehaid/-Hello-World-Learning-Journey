//
//  OnboardingView.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import SwiftUI

struct OnboardingView: View {
    @State private var viewModel = OnboardingViewModel()
    var onStart: (LearningGoal) -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            flameIcon
                .frame(maxWidth: .infinity)
                .padding(.top, 40)

            VStack(alignment: .leading, spacing: 4) {
                Text("Hello \(Text("Learner").fontWeight(.bold))")
                    .font(.largeTitle)
                Text("This app will help you learn everyday!")
                    .foregroundStyle(.secondary)
            }
            .padding(.top, 48)

            GoalFormView(viewModel: viewModel)
                .padding(.top, 32)

            Spacer()

            VStack(spacing: 8) {
                Button("Start Learning") {
                    onStart(viewModel.makeGoal())
                }
                .buttonStyle(.glassProminent)
                .tint(Color.learningOrange)
                .controlSize(.large)
                .disabled(!viewModel.canStart)

                Text("You can edit your desire later")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
            .frame(maxWidth: .infinity)
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 16)
        .preferredColorScheme(.dark)
    }

    private var flameIcon: some View {
        Image(systemName: "flame.fill")
            .font(.system(size: 40))
            .foregroundStyle(Color.learningOrange)
            .frame(width: 109, height: 109)
            .glassEffect(.regular.tint(Color.learningOrange.opacity(0.15)), in: .circle)
    }
}

#Preview {
    OnboardingView { _ in }
}
