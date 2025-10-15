//
//  RocketListView.swift
//  iosApp
//
//  Created by David Soukup on 13.10.2025.
//

import Shared
import SwiftUI

struct RocketListView: View {
    @StateObject private var viewModel: RocketListVM = RocketListVM()
    
    var body: some View {
        VStack {
            switch (viewModel.state.rocketListState) {
            case let success as BasicUiStateSuccess<NSArray>:
                if let rocketList = success.data as? [RocketListModel] {
                    RocketListSuccessView(rockets: rocketList)
                }
            default: Text("default")
            }
        }
        .navigationTitle("Rockets")
    }
}

struct RocketListSuccessView: View {
    var rockets: [RocketListModel]
    
    var body: some View {
        List(rockets, id: \.self.id) { rocket in
            NavigationLink(value: AppRoute.rocketDetail) {
                RocketRow(rocket: rocket)
            }
        }
        .navigationTitle("Rockets")
    }
}

struct RocketRow: View {
    var rocket: RocketListModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "paperplane.fill")
                .resizable()
                .frame(width: 36, height: 36)
                .foregroundStyle(rocket.active ? Color.pink : Color.gray)
            VStack(alignment: .leading) {
                Text(rocket.name)
                    .font(.system(size: 24, weight: .bold))
                Text("First flight: \(rocket.firstFlight)")
                    .font(.system(size: 12, weight: .medium))
            }
            
            
            Spacer()
        }
    }
}
