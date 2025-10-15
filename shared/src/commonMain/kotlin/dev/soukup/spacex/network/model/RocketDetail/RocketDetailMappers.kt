package dev.soukup.spacex.network.model.RocketDetail

import dev.soukup.spacex.model.RocketDetailModel
import dev.soukup.spacex.model.RocketPayloadModel
import dev.soukup.spacex.model.RocketStageModel
import dev.soukup.spacex.model.general.DimensionModel
import dev.soukup.spacex.model.general.WeightModel

fun RocketDetailResp.toModel(): RocketDetailModel {
    return RocketDetailModel(
        height = DimensionModel(
            meters = height.meters,
            feet = height.feet
        ),
        diameter = DimensionModel(
            meters = diameter.meters,
            feet = diameter.feet,
        ),
        mass = WeightModel(
            kg = mass.kg,
            lb = mass.lb
        ),
        stages = listOfNotNull(
            first_stage?.let { stage ->
                RocketStageModel(
                    reusable = stage.reusable,
                    engines = stage.engines,
                    fuelAmountTons = stage.fuel_amount_tons,
                    burnTimeSec = stage.burn_time_sec
                )
            },
            second_stage?.let { stage ->
                RocketStageModel(
                    reusable = stage.reusable,
                    engines = stage.engines,
                    fuelAmountTons = stage.fuel_amount_tons,
                    burnTimeSec = stage.burn_time_sec
                )
            }
        ),
        payloads = payload_weights.map {
            RocketPayloadModel(
                id = it.id,
                name = it.name,
                weight = WeightModel(
                    kg = it.kg,
                    lb = it.lb
                )
            )
        },
        images = flickr_images,
        name = name,
        type = type,
        active = active,
        stagesCount = stages,
        boosters = boosters,
        firstFlight = first_flight,
        country = country,
        company = company,
        wikipedia = wikipedia,
        description = description,
        id = id

    )
}