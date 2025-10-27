package dev.soukup.spacex.viewModel.base

import androidx.lifecycle.ViewModel
import androidx.lifecycle.viewModelScope
import kotlinx.coroutines.CoroutineDispatcher
import kotlinx.coroutines.flow.Flow
import kotlinx.coroutines.flow.MutableSharedFlow
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.asSharedFlow
import kotlinx.coroutines.flow.asStateFlow
import kotlinx.coroutines.flow.flowOn
import kotlinx.coroutines.flow.update
import kotlinx.coroutines.launch
import org.koin.core.component.KoinComponent
import org.koin.core.component.inject
import kotlin.contracts.Effect
import kotlin.getValue

abstract class BaseViewModel<Event : UiEvent, State : UiState, Effect : UiEffect>: ViewModel(), KoinComponent {

    private val initialState: State by lazy { createInitialState() }
    abstract fun createInitialState(): State

    val currentState: State
        get() = uiState.value

    private val _uiState: MutableStateFlow<State> = MutableStateFlow(initialState)
    val uiState = _uiState.asStateFlow()

    private val _event: MutableSharedFlow<Event> = MutableSharedFlow()
    val event = _event.asSharedFlow()

    private val _effect: MutableSharedFlow<Effect> = MutableSharedFlow()
    val effect = _effect.asSharedFlow()

    init {
        subscribeEvents()
    }

    private fun subscribeEvents() {
        viewModelScope.launch {
            event.collect {
                handleEvent(it)
            }
        }
    }

    abstract suspend fun handleEvent(event: Event)

    fun setEvent(event: Event) {
        viewModelScope.launch {
            _event.emit(event)
        }
    }

    protected fun setState(reduce: State.() -> State) {
        _uiState.update { currentState ->
            currentState.reduce()
        }
    }

    protected fun setEffect(builder: () -> Effect) {
        viewModelScope.launch {
            _effect.emit(builder())
        }
    }
}