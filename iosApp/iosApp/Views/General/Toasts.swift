//
//  Toasts.swift
//  iosApp
//
//  Created by David Soukup on 21.10.2025.
//

import SwiftUI
import Toasts


enum Toasts {
    // Refresh
    static let RefreshSuccessfull: ToastValue = ToastValue(
        icon: Image(systemName: "checkmark"),
        message: "Everything is up to date",
        duration: 2.0
      )
    
    static let RefreshFailed: ToastValue = ToastValue(
        icon: Image(systemName: "xmark"),
        message: "Failed to refresh",
        duration: 2.0
      )

}
