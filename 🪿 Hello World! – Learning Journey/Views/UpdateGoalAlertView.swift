//
//  UpdateGoalAlertView.swift
//  🪿 Hello World! – Learning Journey
//
//  Created by Hanin Alfehaid on 02/06/1448 AH.
//

import SwiftUI

struct UpdateGoalAlertView: View {
    var onDismiss: () -> Void
    var onUpdate: () -> Void

    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
                .onTapGesture { onDismiss() }

            VStack(alignment: .leading, spacing: 8) {
                Text("Update goal")
                    .font(.headline)
                Text("If you update now, your streak will start over.")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                HStack(spacing: 12) {
                    Button(action: onDismiss) {
                        Text("Dismiss")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.glass)

                    Button(action: onUpdate) {
                        Text("Update")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.glassProminent)
                    .tint(Color.learningOrange)
                }
                .controlSize(.large)
                .padding(.top, 16)
            }
            .padding(20)
            .frame(maxWidth: 300)
            .glassEffect(.regular, in: .rect(cornerRadius: 32))
        }
    }
}

#Preview {
    UpdateGoalAlertView(onDismiss: {}, onUpdate: {})
        .preferredColorScheme(.dark)
}
