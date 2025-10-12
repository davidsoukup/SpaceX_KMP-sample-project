package dev.soukup.spacex.repository

import dev.soukup.spacex.model.RocketListModel
import dev.soukup.spacex.network.NetworkClientImpl
import dev.soukup.spacex.network.model.toModel

class RocketListRepositoryImpl(
    private val networkClient: NetworkClientImpl
): IRocketListRepository {

    override suspend fun getRocketList(): Result<List<RocketListModel>> {
        return networkClient.getRocketList()
            .mapCatching { list -> list.map { it.toModel() } }
    }
}