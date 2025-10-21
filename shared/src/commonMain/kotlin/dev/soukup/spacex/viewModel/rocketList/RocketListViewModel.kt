package dev.soukup.spacex.viewModel.rocketList

import androidx.lifecycle.viewModelScope
import dev.soukup.spacex.usecase.rocketList.GetRocketListUseCase
import dev.soukup.spacex.viewModel.base.BaseViewModel
import dev.soukup.spacex.viewModel.base.BasicUiState
import kotlinx.coroutines.launch
import org.koin.core.component.inject

open class RocketListViewModel: BaseViewModel<RocketListContract.Event, RocketListContract.State, RocketListContract.Effect>() {

    private val getRocketListUseCase: GetRocketListUseCase by inject()

    override fun createInitialState(): RocketListContract.State = RocketListContract.State.initialState

    override suspend fun handleEvent(event: RocketListContract.Event) {
        when (event) {
            is RocketListContract.Event.TryAgain -> tryAgain()
            is RocketListContract.Event.Refresh -> refresh()
        }
    }

    init {
        viewModelScope.launch {
            loadRocketListData()
        }
    }

    private suspend fun loadRocketListData(setError: Boolean = true) {
        getRocketListUseCase.invoke()
            .onSuccess { rocketListData ->
                setState { copy(rocketListState = BasicUiState.Success(rocketListData))}
            }
            .onFailure { error ->
                if (setError) {
                    setState { copy(rocketListState = BasicUiState.Error(error))}

                }
            }
    }

    private suspend fun tryAgain() {
        setState { copy(rocketListState = BasicUiState.Loading()) }
        loadRocketListData()
    }


    private suspend fun refresh() {
        getRocketListUseCase.invoke()
            .onSuccess { rocketListData ->
                setState { copy(rocketListState = BasicUiState.Success(rocketListData))}
                setEffect { RocketListContract.Effect.ListRefreshed }
            }
            .onFailure { error ->
                setEffect { RocketListContract.Effect.ListRefreshFailed }
            }
    }
}