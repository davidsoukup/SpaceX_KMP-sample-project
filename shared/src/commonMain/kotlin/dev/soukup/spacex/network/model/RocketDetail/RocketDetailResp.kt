package dev.soukup.spacex.network.model.RocketDetail

import dev.soukup.spacex.model.RocketDetailModel
import dev.soukup.spacex.model.RocketPayloadModel
import dev.soukup.spacex.model.RocketStageModel
import dev.soukup.spacex.model.general.DimensionModel
import dev.soukup.spacex.model.general.WeightModel
import kotlinx.serialization.Serializable

@Serializable
data class RocketDetailResp(
    val height: RocketDetailDimensionResp,
    val diameter: RocketDetailDimensionResp,
    val mass: RocketDetailWeightResp,
    val first_stage: RocketDetailStageResp? = null,
    val second_stage: RocketDetailStageResp? = null,
    val payload_weights: List<RocketDetailPayloadResp> = emptyList(),
    val flickr_images: List<String> = emptyList(),
    val name: String,
    val type: String,
    val active: Boolean,
    val stages: Int,
    val boosters: Int,
    val first_flight: String,
    val country: String,
    val company: String,
    val wikipedia: String? = null,
    val description: String,
    val id: String
)

@Serializable
data class RocketDetailDimensionResp(
    val meters: Double,
    val feet: Double
)

@Serializable
data class RocketDetailWeightResp(
    val kg: Double,
    val lb: Double
)

@Serializable
data class RocketDetailStageResp(
    val reusable: Boolean,
    val engines: Int,
    val fuel_amount_tons: Double,
    val burn_time_sec: Int? = null
)

@Serializable
data class RocketDetailPayloadResp(
    val id: String,
    val name: String,
    val kg: Double,
    val lb: Double
)