//
//  NavigationController.swift
//  iosApp
//
//  Created by David Soukup on 15.10.2025.
//

import SwiftUI

@MainActor
final class NavigationController: ObservableObject {
    @Published var path = NavigationPath()
    
    func navigate(to route: AppRoute) {
        path.append(route)
    }
    
    func reset() {
        path = NavigationPath()
    }

    // TODO: Deeplink parser
}

enum AppRoute: Hashable, Codable {
    case rocketList
    case rocketDetail(rocketId: String, rocketName: String)
}
