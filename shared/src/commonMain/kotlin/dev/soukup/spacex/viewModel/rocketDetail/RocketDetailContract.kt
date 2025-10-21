package dev.soukup.spacex.viewModel.rocketDetail

import dev.soukup.spacex.model.RocketDetailModel
import dev.soukup.spacex.viewModel.base.BasicUiState
import dev.soukup.spacex.viewModel.base.UiEffect
import dev.soukup.spacex.viewModel.base.UiEvent
import dev.soukup.spacex.viewModel.base.UiState

interface RocketDetailContract {

    sealed interface Event: UiEvent {
        data object TryAgain: Event
    }

    data class State(
        val rocketDetailState: BasicUiState<RocketDetailModel>
    ): UiState {
        companion object {
            val initialState = State(
                rocketDetailState = BasicUiState.Loading()
            )
        }
    }

    sealed interface Effect: UiEffect {

    }
}