//
//  LearningGoal.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import Foundation

struct LearningGoal: Codable, Equatable {
    var subject: String
    var duration: LearningDuration
    var startDate: Date
}

