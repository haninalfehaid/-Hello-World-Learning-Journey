//
//  ActivityView.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import SwiftUI

struct ActivityView: View {
    var viewModel: ActivityViewModel

    var body: some View {
        VStack(spacing: 24) {
            header

            WeekStripView(days: Date().currentWeekDays) { day in
                viewModel.progress?.status(on: day)
            }

            HStack(spacing: 12) {
                StatCardView(icon: "flame.fill", color: .learningOrange, value: viewModel.learnedDays, title: "Learned")
                StatCardView(icon: "snowflake", color: .freezeBlue, value: viewModel.frozenDays, title: "Freezed")
            }

            Spacer()

            logButton

            Spacer()

            VStack(spacing: 12) {
                freezeButton
                Text("\(viewModel.frozenDays) out of \(viewModel.maxFreezes) Freezes used")
                    .font(.footnote)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.horizontal, 16)
        .padding(.bottom, 24)
        .preferredColorScheme(.dark)
    }

    private var header: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text("Activity")
                    .font(.largeTitle.bold())
                Text(todayText)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            HStack(spacing: 8) {
                NavigationLink {
                    ActivitiesView(viewModel: viewModel)
                } label: {
                    Image(systemName: "calendar")
                        .frame(width: 32, height: 32)
                }

                NavigationLink {
                    LearningGoalView(activityViewModel: viewModel)
                } label: {
                    Image(systemName: "pencil.and.outline")
                        .frame(width: 32, height: 32)
                }
            }
            .buttonStyle(.glass)
            .buttonBorderShape(.circle)
        }
    }

    private var todayText: String {
        let formatter = DateFormatter()
        formatter.calendar = .gregorianCalendar
        formatter.locale = Locale(identifier: "en_US")
        formatter.dateFormat = "EEEE, d MMMM"
        return formatter.string(from: Date())
    }

    private var logButton: some View {
        Button {
            viewModel.toggleLearned()
        } label: {
            Text(logTitle)
                .font(.title2.weight(.bold))
                .foregroundStyle(logTextColor)
                .frame(width: 274, height: 274)
                .glassEffect(.regular.tint(logTint).interactive(), in: .circle)
        }
        .buttonStyle(.plain)
        
    }

    private var logTitle: String {
        viewModel.todayStatus == .learned ? "Logged as Learned" : "Log as Learned"
    }

    private var logTint: Color {
        viewModel.todayStatus == .learned ? .clear : .learningOrange
    }

    private var logTextColor: Color {
        viewModel.todayStatus == .learned ? .secondary : .white
    }

    private var freezeButton: some View {
        Button {
            viewModel.freezeToday()
        } label: {
            Text(viewModel.canFreezeToday ? "Freeze for a day" : "Freezed for a day")
                .font(.headline)
                .frame(maxWidth: 274)
                .padding(.vertical, 6)
        }
        .buttonStyle(.glassProminent)
        .tint(Color.freezeBlue)
        .controlSize(.large)
        .disabled(!viewModel.canFreezeToday)
    }
}

#Preview {
    UserDefaults.standard.removeObject(forKey: "learningProgress")
    let viewModel = ActivityViewModel()
    viewModel.startGoal(LearningGoal(subject: "Swift", duration: .week, startDate: Date()))
    return NavigationStack {
        ActivityView(viewModel: viewModel)
    }
}
