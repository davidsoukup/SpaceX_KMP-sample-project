package dev.soukup.spacex.model

import kotlinx.serialization.Serializable

@Serializable
data class RocketListModel(
    val name: String,
    val type: String,
    val active: Boolean,
    val stages: Int,
    val boosters: Int,
    val firstFlight: String,
    val country: String,
    val company: String,
    val description: String,
    val id: String
)