package dev.soukup.spacex.di

import dev.soukup.spacex.network.INetworkClient
import dev.soukup.spacex.network.NetworkClientImpl
import dev.soukup.spacex.repository.IRocketListRepository
import dev.soukup.spacex.repository.RocketListRepositoryImpl
import dev.soukup.spacex.useCase.rocketList.GetRocketListUseCase
import org.koin.core.context.startKoin
import org.koin.core.module.Module
import org.koin.dsl.module

fun initKoin(){
    startKoin {
        modules(
            client,
            repositoryModule,
            rocketListUseCaseModule
        )
    }
}

val client: Module = module {
    single<INetworkClient> { NetworkClientImpl() }
}

val repositoryModule = module {
    single<IRocketListRepository> { RocketListRepositoryImpl(get()) }
}

val rocketListUseCaseModule = module {
    factory { GetRocketListUseCase(get()) }
}