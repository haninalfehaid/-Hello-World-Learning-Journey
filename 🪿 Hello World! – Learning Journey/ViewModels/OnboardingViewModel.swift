//
//  OnboardingViewModel.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import Foundation
import Observation

@Observable
final class OnboardingViewModel {
    var subject: String = ""
    var duration: LearningDuration = .week

    var canStart: Bool {
        !subject.trimmingCharacters(in: .whitespaces).isEmpty
    }

    func makeGoal() -> LearningGoal {
        LearningGoal(
            subject: subject.trimmingCharacters(in: .whitespaces),
            duration: duration,
            startDate: Date()
        )
    }
}
