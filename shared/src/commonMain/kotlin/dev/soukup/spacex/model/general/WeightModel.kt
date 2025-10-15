package dev.soukup.spacex.model.general

import kotlinx.serialization.Serializable

@Serializable
data class WeightModel(
    val kg: Double,
    val lb: Double
) {
    val kilogramsFormatted: String
        get() = "$kg m"

    val poundsFormatted: String
        get() = "$lb ft"
}