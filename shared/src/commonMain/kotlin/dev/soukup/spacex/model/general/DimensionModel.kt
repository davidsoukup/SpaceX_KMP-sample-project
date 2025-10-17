package dev.soukup.spacex.model.general

import dev.soukup.spacex.utils.SharedNumberFormatter
import kotlinx.serialization.Serializable

data class DimensionModel(
    val meters: Double,
    val feet: Double
) {
    val metersFormated: String
        get() = "${SharedNumberFormatter.maxTwoDecimals(meters)} m"

    val feetFormatted: String
        get() = "${SharedNumberFormatter.maxTwoDecimals(feet)} ft"
}