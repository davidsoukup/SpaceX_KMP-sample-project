package dev.soukup.spacex.viewModel.rocketDetail

import androidx.lifecycle.viewModelScope
import dev.soukup.spacex.usecase.rocketDetail.GetRocketDetailUseCase
import dev.soukup.spacex.viewModel.base.BaseViewModel
import dev.soukup.spacex.viewModel.base.BasicUiState
import kotlinx.coroutines.launch
import org.koin.core.component.inject
import kotlin.getValue

open class RocketDetailViewModel(
    val rocketId: String
): BaseViewModel<RocketDetailContract.Event, RocketDetailContract.State, RocketDetailContract.Effect>() {

    private val getRocketDetailUseCase: GetRocketDetailUseCase by inject()

    override fun createInitialState(): RocketDetailContract.State = RocketDetailContract.State.initialState

    override suspend fun handleEvent(event: RocketDetailContract.Event) {
        when (event) {
            is RocketDetailContract.Event.TryAgain -> {
                setState { copy(rocketDetailState = BasicUiState.Loading()) }
                loadRocketDetail()
            }
        }
    }

    init {
        viewModelScope.launch {
            loadRocketDetail()
        }
    }

    private suspend fun loadRocketDetail() {
        getRocketDetailUseCase.invoke(rocketId)
            .onSuccess { rocketListData ->
                setState { copy(rocketDetailState = BasicUiState.Success(rocketListData))}
            }
            .onFailure { error ->
                setState { copy(rocketDetailState = BasicUiState.Error(error))}
            }
    }
}