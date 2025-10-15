//
//  RocketDetailView.swift
//  iosApp
//
//  Created by David Soukup on 15.10.2025.
//

import Shared
import SwiftUI

struct RocketDetailView: View {
    @StateObject private var viewModel: RocketDetailVM
    
    var rocketName: String
    
    init(rocketId: String, rocketName: String) {
        self._viewModel = .init(wrappedValue: .init(rocketId: rocketId))
        self.rocketName = rocketName
    }
    
    var body: some View {
        VStack {
            switch viewModel.state.rocketDetailState {
            case let success as BasicUiStateSuccess<NSObject>:
                if let rocketDetail = success.data as? RocketDetailModel {
                    RocketDetailSuccessView(rocketDetail: rocketDetail)
                }
            default: Text("default")
            }
        }
        .navigationTitle(rocketName)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Launch") {

                }
            }
        }
    }
}
