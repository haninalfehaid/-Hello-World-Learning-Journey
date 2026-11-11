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
                    DayCircleView(day: day, status: status(day))
                        .frame(maxWidth: .infinity)
                }
            }
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
