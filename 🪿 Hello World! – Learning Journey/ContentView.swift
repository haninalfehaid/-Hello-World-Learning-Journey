import SwiftUI

struct ContentView: View {
    @State private var viewModel = ActivityViewModel()

    var body: some View {
        NavigationStack {
            if viewModel.hasGoal {
                ActivityView(viewModel: viewModel)
            } else {
                OnboardingView { goal in
                    viewModel.startGoal(goal)
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
