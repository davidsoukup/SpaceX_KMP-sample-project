package dev.soukup.spacex.model

import dev.soukup.spacex.model.general.DimensionModel
import dev.soukup.spacex.model.general.WeightModel

data class RocketDetailModel(
    val height: DimensionModel,
    val diameter: DimensionModel,
    val mass: WeightModel,
    val stages: List<RocketStageModel>,
    val payloads: List<RocketPayloadModel>,
    val images: List<String>,
    val name: String,
    val type: String,
    val active: Boolean,
    val stagesCount: Int,
    val boosters: Int,
    val firstFlight: String,
    val country: String,
    val company: String,
    val wikipedia: String? = null,
    val description: String,
    val id: String
)

data class RocketStageModel(
    val reusable: Boolean,
    val engines: Int,
    val fuelAmountTons: Double,
    val burnTimeSec: Int
)

data class RocketPayloadModel(
    val id: String,
    val name: String,
    val weight: WeightModel
)