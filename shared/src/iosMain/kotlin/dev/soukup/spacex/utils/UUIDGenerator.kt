package dev.soukup.spacex.utils

import platform.Foundation.NSUUID

actual class UUIDGenerator {
    actual companion object {
        actual fun generateUUID(): String = NSUUID().UUIDString()
    }
}