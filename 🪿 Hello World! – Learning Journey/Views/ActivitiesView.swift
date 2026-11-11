//
//  ActivitiesView.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 02/06/1448 AH.
//

import SwiftUI

struct ActivitiesView: View {
    var viewModel: ActivityViewModel

    private let columns = Array(repeating: GridItem(.flexible()), count: 7)
    private let weekdaySymbols = Calendar.gregorianCalendar.shortWeekdaySymbols.map { $0.uppercased() }

    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: 24) {
                ForEach(viewModel.historyMonths, id: \.self) { month in
                    monthSection(month)
                    Divider()
                }
            }
            .padding(.horizontal, 16)
        }
        .defaultScrollAnchor(.bottom, for: .initialOffset)
        .navigationTitle("Activities")
        .navigationBarTitleDisplayMode(.inline)
        .preferredColorScheme(.dark)
    }

    private func monthSection(_ month: Date) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Text(month.monthTitle)
                .font(.headline)

            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(weekdaySymbols, id: \.self) { symbol in
                    Text(symbol)
                        .font(.caption.weight(.semibold))
                        .foregroundStyle(.secondary)
                }

                ForEach(Array(month.monthGridDays.enumerated()), id: \.offset) { _, day in
                    if let day {
                        DayCircleView(day: day, status: viewModel.progress?.status(on: day))
                    } else {
                        Color.clear
                            .frame(height: 44)
                    }
                }
            }
        }
    }
}

#Preview {
    UserDefaults.standard.removeObject(forKey: "learningProgress")
    let viewModel = ActivityViewModel()
    viewModel.startGoal(LearningGoal(subject: "Swift", duration: .week, startDate: Date()))
    viewModel.progress?.logs.append(DayLog(date: Date().addingTimeInterval(-86400 * 35), status: .learned))
    viewModel.progress?.logs.append(DayLog(date: Date().addingTimeInterval(-86400 * 2), status: .frozen))
    return NavigationStack {
        ActivitiesView(viewModel: viewModel)
    }
}
