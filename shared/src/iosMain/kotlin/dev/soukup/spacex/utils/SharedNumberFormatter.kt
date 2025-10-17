package dev.soukup.spacex.utils

import platform.Foundation.NSNumber
import platform.Foundation.NSNumberFormatter
import platform.Foundation.NSNumberFormatterDecimalStyle

actual object SharedNumberFormatter {
    private val formatter = NSNumberFormatter()
    private val numberStyle = NSNumberFormatterDecimalStyle

    actual fun maxTwoDecimals(double: Double): String {
        formatter.minimumFractionDigits = 0u
        formatter.maximumFractionDigits = 2u
        formatter.numberStyle = numberStyle
        return try {
            formatter.stringFromNumber(NSNumber(double))!!
        } catch (e: Exception) {
            println("NumberFormatting failed. Returning 0")
            "0"
        }
    }
}