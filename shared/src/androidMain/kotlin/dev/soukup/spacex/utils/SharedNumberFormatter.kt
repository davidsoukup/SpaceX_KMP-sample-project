package dev.soukup.spacex.utils

actual object SharedNumberFormatter {
    actual fun maxTwoDecimals(double: Double): String {
        val df = java.text.DecimalFormat()
        df.isGroupingUsed = true
        df.maximumFractionDigits = 2
        df.isDecimalSeparatorAlwaysShown = false
        return df.format(double)
    }
}