package dev.soukup.spacex.viewModel.base

import dev.soukup.spacex.utils.UUIDGenerator

sealed interface BasicUiState<out T> {
    
    data class Success<T>(
        val data: T,
    ) : BasicUiState<T>

    data class Error(
        val message: Throwable? = null
    ) : BasicUiState<Nothing>

    data class Loading(
        val data: Any? = null // Any additional data needed in loading
    ) : BasicUiState<Nothing>

    val isLoading: Boolean
        get() = this is Loading

    val isSuccess: Boolean
        get() = this is Success<*>
}