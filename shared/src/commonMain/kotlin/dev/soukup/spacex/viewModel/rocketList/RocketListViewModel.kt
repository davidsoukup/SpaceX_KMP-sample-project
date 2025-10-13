package dev.soukup.spacex.viewModel.rocketList

import androidx.lifecycle.viewModelScope
import dev.soukup.spacex.useCase.rocketList.GetRocketListUseCase
import dev.soukup.spacex.viewModel.base.BaseViewModel
import dev.soukup.spacex.viewModel.base.BasicUiState
import kotlinx.coroutines.launch
import org.koin.core.component.inject

open class RocketListViewModel: BaseViewModel<RocketListContract.Event, RocketListContract.State, RocketListContract.Effect>() {

    private val getRocketListUseCase: GetRocketListUseCase by inject()

    override fun createInitialState(): RocketListContract.State = RocketListContract.State.initialState

    override suspend fun handleEvent(event: RocketListContract.Event) {

    }

    init {
        viewModelScope.launch {
            loadRocketListData()
        }
    }

    private suspend fun loadRocketListData() {
        getRocketListUseCase.invoke()
            .onSuccess { rocketListData ->
                setState { copy(rocketListState = BasicUiState.Success(rocketListData))}
            }
            .onFailure { error ->
                setState { copy(rocketListState = BasicUiState.Error(error))}
            }
    }
}