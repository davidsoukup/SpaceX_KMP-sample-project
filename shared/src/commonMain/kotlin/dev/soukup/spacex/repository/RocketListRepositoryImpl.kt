package dev.soukup.spacex.repository

import dev.soukup.spacex.model.RocketDetailModel
import dev.soukup.spacex.model.RocketListModel
import dev.soukup.spacex.network.INetworkClient
import dev.soukup.spacex.network.model.RocketDetail.toModel
import dev.soukup.spacex.network.model.RocketList.toModel

class RocketListRepositoryImpl(
    private val networkClient: INetworkClient
): IRocketListRepository {

    override suspend fun getRocketList(): Result<List<RocketListModel>> {
        return networkClient.getRocketList()
            .mapCatching { respList -> respList.map { it.toModel() } }
    }

    override suspend fun getRocketDetail(rocketId: String): Result<RocketDetailModel> {
        return networkClient.getRocketDetail(rocketId)
            .mapCatching { resp -> resp.toModel() }
    }
}