//
//  Date+Week.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import Foundation

extension Calendar {
    static let gregorianCalendar: Calendar = {
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = Locale(identifier: "en_US")
        return calendar
    }()
}

extension Date {
    var currentWeekDays: [Date] {
        let calendar = Calendar.gregorianCalendar
        let today = calendar.startOfDay(for: self)
        let weekday = calendar.component(.weekday, from: today)
        let startOfWeek = calendar.date(byAdding: .day, value: -(weekday - 1), to: today) ?? today

        return (0..<7).compactMap { offset in
            calendar.date(byAdding: .day, value: offset, to: startOfWeek)
        }
    }

    var dayNumber: Int {
        Calendar.gregorianCalendar.component(.day, from: self)
    }

    var monthGridDays: [Date?] {
        let calendar = Calendar.gregorianCalendar
        guard let interval = calendar.dateInterval(of: .month, for: self),
              let range = calendar.range(of: .day, in: .month, for: self) else { return [] }

        let firstWeekday = calendar.component(.weekday, from: interval.start)
        let emptySlots: [Date?] = Array(repeating: nil, count: firstWeekday - 1)
        let days: [Date?] = range.compactMap { day in
            calendar.date(byAdding: .day, value: day - 1, to: interval.start)
        }

        return emptySlots + days
    }

    var monthTitle: String {
        let formatter = DateFormatter()
        formatter.calendar = .gregorianCalendar
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "MMMM yyyy"
        return formatter.string(from: self)
    }
}
