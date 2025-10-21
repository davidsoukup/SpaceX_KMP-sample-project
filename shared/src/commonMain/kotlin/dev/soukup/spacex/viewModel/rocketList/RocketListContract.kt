package dev.soukup.spacex.viewModel.rocketList

import dev.soukup.spacex.model.RocketListModel
import dev.soukup.spacex.viewModel.base.BasicUiState
import dev.soukup.spacex.viewModel.base.UiEffect
import dev.soukup.spacex.viewModel.base.UiEvent
import dev.soukup.spacex.viewModel.base.UiState

interface RocketListContract {

    sealed interface Event: UiEvent {
        data object TryAgain: Event
        data object Refresh: Event
    }

    data class State(
        val rocketListState: BasicUiState<List<RocketListModel>>
    ): UiState {
        companion object {
            val initialState = State(
                rocketListState = BasicUiState.Loading()
            )
        }
    }

    sealed interface Effect: UiEffect {
        data object ListRefreshed: Effect
        data object ListRefreshFailed: Effect
    }
}