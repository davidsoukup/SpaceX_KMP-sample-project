package dev.soukup.spacex.repository

import dev.soukup.spacex.utils.annotations.ApiCall
import dev.soukup.spacex.model.RocketListModel

interface IRocketListRepository {
    // Region API Calls

    /**
     * Get list of rockets
     * @return [Result] of [RocketListModel] which is either [Result.success] or [Result.failure]
     */
    @ApiCall
    suspend fun getRocketList(): Result<List<RocketListModel>>
}