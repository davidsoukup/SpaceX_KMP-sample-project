package dev.soukup.spacex.network.model

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

fun RocketListResp.toModel(): RocketListModel {
    return RocketListModel(
        name = name,
        type = type,
        active = active,
        stages = stages,
        boosters = boosters,
        firstFlight = first_flight,
        country = country,
        company = company,
        description = description,
        id = id
    )
}