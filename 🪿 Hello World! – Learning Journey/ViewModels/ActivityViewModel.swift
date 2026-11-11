//
//  ActivityViewModel.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import Foundation
import Observation

@Observable
final class ActivityViewModel {
    private let storageKey = "learningProgress"
    private let streakLimit: TimeInterval = 32 * 60 * 60

    var progress: LearningProgress? {
        didSet { save() }
    }

    init() {
        progress = load()
    }

    var hasGoal: Bool {
        progress != nil
    }

    var todayStatus: DayStatus? {
        progress?.status(on: Date())
    }

    var isStreakBroken: Bool {
        guard let progress else { return false }
        return Date().timeIntervalSince(progress.streakReferenceDate) > streakLimit
    }

    var isGoalCompleted: Bool {
        progress?.isGoalCompleted ?? false
    }

    var canLogToday: Bool {
        todayStatus == nil && !isStreakBroken && !isGoalCompleted
    }

    var canFreezeToday: Bool {
        canLogToday && (progress?.freezesLeft ?? 0) > 0
    }

    var learnedDays: Int {
        progress?.learnedDays ?? 0
    }

    var frozenDays: Int {
        progress?.frozenDays ?? 0
    }

    var maxFreezes: Int {
        progress?.goal.duration.maxFreezes ?? 0
    }

    func startGoal(_ goal: LearningGoal) {
        if progress == nil {
            progress = LearningProgress(goal: goal)
        } else {
            progress?.goal = goal
        }
    }

    func logAsLearned() {
        guard canLogToday else { return }
        progress?.logs.append(DayLog(date: Date(), status: .learned))
    }

    func freezeToday() {
        guard canFreezeToday else { return }
        progress?.logs.append(DayLog(date: Date(), status: .frozen))
    }

    private func save() {
        guard let progress else { return }
        if let data = try? JSONEncoder().encode(progress) {
            UserDefaults.standard.set(data, forKey: storageKey)
        }
    }

    private func load() -> LearningProgress? {
        guard let data = UserDefaults.standard.data(forKey: storageKey) else { return nil }
        return try? JSONDecoder().decode(LearningProgress.self, from: data)
    }
}
