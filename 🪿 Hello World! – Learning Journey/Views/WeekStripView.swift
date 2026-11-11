//
//  WeekStripView.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import SwiftUI

struct WeekStripView: View {
    let days: [Date]
    let status: (Date) -> DayStatus?

    private let symbols = Calendar.gregorianCalendar.veryShortWeekdaySymbols

    var body: some View {
        VStack(spacing: 8) {
            HStack {
                ForEach(symbols.indices, id: \.self) { index in
                    Text(symbols[index])
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: .infinity)
                }
            }

            HStack {
                ForEach(days, id: \.self) { day in
                    dayCircle(for: day)
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }

    private func dayCircle(for day: Date) -> some View {
        let dayStatus = status(day)
        let isToday = Calendar.gregorianCalendar.isDateInToday(day)

        return Text("\(day.dayNumber)")
            .font(.title3.weight(.medium))
            .foregroundStyle(textColor(for: dayStatus))
            .frame(width: 44, height: 44)
            .background(backgroundColor(for: dayStatus, isToday: isToday), in: .circle)
    }

    private func textColor(for status: DayStatus?) -> Color {
        switch status {
        case .learned: return .learningOrange
        case .frozen: return .freezeBlue
        case nil: return .primary
        }
    }

    private func backgroundColor(for status: DayStatus?, isToday: Bool) -> Color {
        switch status {
        case .learned: return .learningOrange.opacity(0.2)
        case .frozen: return .freezeBlue.opacity(0.2)
        case nil: return isToday ? .learningOrange : .clear
        }
    }
}

#Preview {
    let days = Date().currentWeekDays
    WeekStripView(days: days) { day in
        if day == days[0] { return .learned }
        if day == days[1] { return .frozen }
        return nil
    }
    .padding()
    .preferredColorScheme(.dark)
}
