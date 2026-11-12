//
//  LearningDuration.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import Foundation

enum LearningDuration: String, CaseIterable, Codable, Identifiable {
    case week = "Week"
    case month = "Month"
    case year = "Year"

    var id: String { rawValue }

    var totalDays: Int {
        switch self {
        case .week:  return 5
        case .month: return 30
        case .year:  return 365
        }
    }

    var maxFreezes: Int {
        switch self {
        case .week:  return 2
        case .month: return 8
        case .year:  return 96
        }
    }
}
