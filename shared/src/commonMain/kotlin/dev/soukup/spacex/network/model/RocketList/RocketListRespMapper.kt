package dev.soukup.spacex.network.model.RocketList

import dev.soukup.spacex.model.RocketListModel


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