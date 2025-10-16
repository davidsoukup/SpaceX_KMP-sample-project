package dev.soukup.spacex.viewModel.base

import dev.soukup.spacex.utils.UUIDGenerator

sealed interface BasicUiState<out T> {
    val id: String
        get() = UUIDGenerator.generateUUID()

    data class Success<T>(
        val data: T,
    ) : BasicUiState<T> {

        override fun equals(other: Any?): Boolean {
            if (this === other) return true
            if (other !is Success<*>) return false

            if (data != other.data) return false

            return true
        }

        override fun hashCode(): Int {
            var result = data?.hashCode() ?: 0
            result = 31 * result.hashCode()
            return result
        }
    }

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