import SwiftUI

struct ContentView: View {
    @StateObject private var navigationController = NavigationController()
    
    var body: some View {
        NavigationStack(path: $navigationController.path) {
            RocketListView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .rocketList:
                        RocketListView()
                    case .rocketDetail(let rocketId, let rocketName):
                        RocketDetailView(rocketId: rocketId, rocketName: rocketName)
                    }
                }
        }
        .environmentObject(navigationController)
    }
}
