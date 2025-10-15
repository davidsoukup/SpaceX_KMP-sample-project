package dev.soukup.spacex.usecase.rocketList

import dev.soukup.spacex.model.RocketListModel
import dev.soukup.spacex.repository.IRocketListRepository

class GetRocketListUseCase(
    private val rocketListRepository: IRocketListRepository
) {
    suspend operator fun invoke(): Result<List<RocketListModel>> = rocketListRepository.getRocketList()
}