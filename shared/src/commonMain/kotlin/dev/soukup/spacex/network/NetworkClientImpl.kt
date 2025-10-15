package dev.soukup.spacex.network

import dev.soukup.spacex.model.RocketListModel
import dev.soukup.spacex.network.model.RocketListResp
import io.ktor.client.HttpClient
import io.ktor.client.call.body
import io.ktor.client.plugins.HttpTimeout
import io.ktor.client.plugins.contentnegotiation.ContentNegotiation
import io.ktor.client.request.get
import io.ktor.serialization.kotlinx.json.json
import kotlinx.serialization.builtins.ListSerializer
import kotlinx.serialization.json.Json
import io.ktor.client.call.*
import io.ktor.client.request.*
import kotlinx.serialization.Serializable

class NetworkClientImpl: INetworkClient {

    private val url: String
        get() = "https://api.spacexdata.com/v4/"

    val client = HttpClient {
        expectSuccess = true
        install(ContentNegotiation) {
            json(Json {
                prettyPrint = true
                isLenient = true
                ignoreUnknownKeys = true
            })
        }
        install(HttpTimeout) {
            requestTimeoutMillis = 15_000 // 1% seconds
        }
    }


    /**
     * Generic GET function.
     * [path] - endpoint path without the base URL (e.g. "rockets")
     * [callerName] - name of the calling function (for logging/error context)
     */
    private suspend inline fun <reified T> get(
        path: String,
        callerName: String
    ): Result<T> {
        return try {
            val response: T = client.get("$url$path").body()
            Result.success(response)
        } catch (e: Exception) {
            println("❌ GET failed in $callerName → $path: ${e.message}")
            Result.failure(e)
        }
    }


    override suspend fun getRocketList(): Result<List<RocketListResp>> {
        return get(path = "rockets", callerName = ::getRocketList.name)
    }
}