package dev.soukup.spacex.model.general

import dev.soukup.spacex.utils.SharedNumberFormatter
import kotlinx.serialization.Serializable

@Serializable
data class WeightModel(
    val kg: Double,
    val lb: Double
) {
    val kilogramsFormatted: String
        get() = "${SharedNumberFormatter.maxTwoDecimals(kg)} m"

    val tonsFormatted: String
        get() = "${SharedNumberFormatter.maxTwoDecimals(kg / 1000)} t"

    val poundsFormatted: String
        get() = "${SharedNumberFormatter.maxTwoDecimals(lb)} ft"
}