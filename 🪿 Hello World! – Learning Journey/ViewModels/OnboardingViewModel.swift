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
    var subject: String
    var duration: LearningDuration

    init(goal: LearningGoal? = nil) {
        subject = goal?.subject ?? ""
        duration = goal?.duration ?? .week
    }

    var canStart: Bool {
        !subject.trimmingCharacters(in: .whitespaces).isEmpty
    }

    func hasChanges(from goal: LearningGoal) -> Bool {
        subject.trimmingCharacters(in: .whitespaces) != goal.subject || duration != goal.duration
    }

    func makeGoal() -> LearningGoal {
        LearningGoal(
            subject: subject.trimmingCharacters(in: .whitespaces),
            duration: duration,
            startDate: Date()
        )
    }
}
