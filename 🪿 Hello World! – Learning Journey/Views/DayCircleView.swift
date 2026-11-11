//
//  DayCircleView.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 02/06/1448 AH.
//

import SwiftUI

struct DayCircleView: View {
    let day: Date
    let status: DayStatus?

    private var isToday: Bool {
        Calendar.gregorianCalendar.isDateInToday(day)
    }

    var body: some View {
        Text("\(day.dayNumber)")
            .font(.title3.weight(.medium))
            .foregroundStyle(textColor)
            .frame(width: 44, height: 44)
            .background(backgroundColor, in: .circle)
    }

    private var textColor: Color {
        switch status {
        case .learned: return .learningOrange
        case .frozen: return .freezeBlue
        case nil: return .primary
        }
    }

    private var backgroundColor: Color {
        switch status {
        case .learned: return .learningOrange.opacity(0.2)
        case .frozen: return .freezeBlue.opacity(0.2)
        case nil: return isToday ? .learningOrange : .clear
        }
    }
}

#Preview {
    HStack {
        DayCircleView(day: Date().addingTimeInterval(-86400), status: .learned)
        DayCircleView(day: Date().addingTimeInterval(-172800), status: .frozen)
        DayCircleView(day: Date(), status: nil)
    }
    .preferredColorScheme(.dark)
}
