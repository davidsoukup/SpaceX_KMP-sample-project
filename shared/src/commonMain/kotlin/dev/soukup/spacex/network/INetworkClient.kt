package dev.soukup.spacex.network

import dev.soukup.spacex.network.model.RocketDetail.RocketDetailResp
import dev.soukup.spacex.network.model.RocketList.RocketListResp

interface INetworkClient {

    suspend fun getRocketList(): Result<List<RocketListResp>>
    suspend fun getRocketDetail(rocketId: String): Result<RocketDetailResp>
}