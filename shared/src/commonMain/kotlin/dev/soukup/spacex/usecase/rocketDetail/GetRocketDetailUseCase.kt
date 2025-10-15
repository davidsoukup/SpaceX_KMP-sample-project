package dev.soukup.spacex.usecase.rocketDetail

import dev.soukup.spacex.model.RocketDetailModel
import dev.soukup.spacex.repository.IRocketListRepository

class GetRocketDetailUseCase(
    private val rocketListRepository: IRocketListRepository
) {
    suspend operator fun invoke(rocketId: String): Result<RocketDetailModel> = rocketListRepository.getRocketDetail(rocketId)
}