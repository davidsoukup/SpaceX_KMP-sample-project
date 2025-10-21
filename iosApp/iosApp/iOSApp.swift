import Shared
import SwiftUI
import Toasts

@main
struct iOSApp: App {
    
    init() {
        KoinKt.doInitKoin()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
                .installToast(position: .bottom)
        }
    }
}
