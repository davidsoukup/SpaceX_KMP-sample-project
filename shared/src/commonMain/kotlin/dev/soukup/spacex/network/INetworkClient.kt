package dev.soukup.spacex.network

import dev.soukup.spacex.network.model.RocketListResp

interface INetworkClient {

    suspend fun getRocketList(): Result<List<RocketListResp>>
}