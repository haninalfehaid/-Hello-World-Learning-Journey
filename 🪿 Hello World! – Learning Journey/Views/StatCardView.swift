//
//  StatCardView.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 01/06/1448 AH.
//

import SwiftUI

struct StatCardView: View {
    let icon: String
    let color: Color
    let value: Int
    let title: String

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.title3)
                .foregroundStyle(color)
            Text(value.daysText)
                .font(.headline)
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .glassEffect(.regular, in: .rect(cornerRadius: 24))
    }
}

#Preview {
    HStack(spacing: 12) {
        StatCardView(icon: "flame.fill", color: .learningOrange, value: 4, title: "Learned")
        StatCardView(icon: "snowflake", color: .freezeBlue, value: 1, title: "Freezed")
    }
    .padding()
    .preferredColorScheme(.dark)
}
