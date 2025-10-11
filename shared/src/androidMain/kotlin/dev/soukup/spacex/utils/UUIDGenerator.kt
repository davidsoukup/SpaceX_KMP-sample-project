package dev.soukup.spacex.utils

import java.util.UUID

actual class UUIDGenerator {
    actual companion object {
        actual fun generateUUID(): String = UUID.randomUUID().toString()
    }
}