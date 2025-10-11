package dev.soukup.spacex.utils

expect class UUIDGenerator {
    companion object{
        fun generateUUID(): String
    }
}