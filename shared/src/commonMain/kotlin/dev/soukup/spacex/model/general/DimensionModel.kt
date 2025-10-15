package dev.soukup.spacex.model.general

import kotlinx.serialization.Serializable

data class DimensionModel(
    val meters: Double,
    val feet: Double
) {
    val metersFormated: String
        get() = "$meters m"

    val feetFormatted: String
        get() = "$feet ft"
}