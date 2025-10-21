//
//  RocketListVM.swift
//  iosApp
//
//  Created by David Soukup on 13.10.2025.
//

import Foundation
import Shared

class RocketListVM: RocketListViewModel, ObservableObject {
    @Published var state: RocketListContractState = .companion.initialState
    
    @MainActor private func collect() async {
        for await state in self.uiState {
            self.state = state
        }
    }
    
    override init() {
        super.init()
        Task {
            await collect()
        }
    }
}

extension RocketListVM {
    func tryAgain() {
        self.setEvent(event: RocketListContractEventTryAgain())
    }
    
    func refresh() {
        self.setEvent(event: RocketListContractEventRefresh())
    }
}
