package dev.soukup.spacex

interface Platform {
    val name: String
}

expect fun getPlatform(): Platform