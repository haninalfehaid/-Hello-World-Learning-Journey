//
//  LearningProgress.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import Foundation

struct LearningProgress: Codable {
    var goal: LearningGoal
    var logs: [DayLog] = []

    var lastLogDate: Date? {
        logs.map(\.date).max()
    }

    var streakReferenceDate: Date {
        lastLogDate ?? goal.startDate
    }

    func status(on day: Date) -> DayStatus? {
        logs.first { Calendar.current.isDate($0.date, inSameDayAs: day) }?.status
    }

    var currentLogs: [DayLog] {
        logs.filter { $0.date >= goal.startDate }
    }

    var learnedDays: Int {
        currentLogs.filter { $0.status == .learned }.count
    }

    var frozenDays: Int {
        currentLogs.filter { $0.status == .frozen }.count
    }

    var freezesLeft: Int {
        goal.duration.maxFreezes - frozenDays
    }

    var isGoalCompleted: Bool {
        learnedDays + frozenDays >= goal.duration.totalDays
    }
}
