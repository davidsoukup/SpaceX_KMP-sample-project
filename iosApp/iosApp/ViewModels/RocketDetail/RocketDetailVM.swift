//
//  RocketDetailVM.swift
//  iosApp
//
//  Created by David Soukup on 15.10.2025.
//

import Foundation
import Shared

class RocketDetailVM: RocketDetailViewModel, ObservableObject {
    @Published var state: RocketDetailContractState = .companion.initialState
    
    @MainActor private func collect() async {
        for await state in self.uiState {
            self.state = state
        }
    }
    
    override init(rocketId: String) {
        super.init(rocketId: rocketId)
        Task {
            await collect()
        }
    }
}

extension RocketDetailVM {
    func tryAgain() {
        self.setEvent(event: RocketDetailContractEventTryAgain())
    }
}
