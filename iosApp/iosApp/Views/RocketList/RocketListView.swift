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
        Group {
            switch (viewModel.state.rocketListState) {
            case let success as BasicUiStateSuccess<NSArray>:
                if let rocketList = success.data as? [RocketListModel] {
                    RocketListSuccessView(rockets: rocketList)
                }
            case is BasicUiStateLoading:
                LoadingStateView()
            default:
                ErrorStateView(
                    onTryAgain: {
                        viewModel.tryAgain()
                    }
                )
                .padding(.horizontal, Spacing.medium)
            }
        }
        .navigationTitle("Rockets")
        .environmentObject(viewModel)
    }
}
