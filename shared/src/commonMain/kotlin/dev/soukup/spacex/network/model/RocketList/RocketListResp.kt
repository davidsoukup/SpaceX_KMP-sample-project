package dev.soukup.spacex.network.model.RocketList

import dev.soukup.spacex.model.RocketListModel
import kotlinx.serialization.Serializable

@Serializable
data class RocketListResp(
    val name: String,
    val type: String,
    val active: Boolean,
    val stages: Int,
    val boosters: Int,
    val first_flight: String,
    val country: String,
    val company: String,
    val description: String,
    val id: String
)