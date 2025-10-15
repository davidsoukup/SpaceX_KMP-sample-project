package dev.soukup.spacex.repository

import dev.soukup.spacex.model.RocketDetailModel
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


    /**
     * Get rocket detail
     * @return [Result] of [RocketDetailModel] which is either [Result.success] or [Result.failure]
     */
    @ApiCall
    suspend fun getRocketDetail(rocketId: String): Result<RocketDetailModel>
}
