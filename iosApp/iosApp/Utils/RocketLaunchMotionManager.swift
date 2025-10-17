//
//  RocketLaunch.swift
//  iosApp
//
//  Created by David Soukup on 16.10.2025.
//

import CoreMotion

final class RocketLaunchMotionManager: ObservableObject {
    private let manager = CMMotionManager()
    private let threshold: Double = 0.35
    private var lastLaunchTime: Date = .distantPast
    private let cooldown: TimeInterval = 3

    func startMonitoring(onLaunch: @escaping (Bool) -> Void) {
        guard manager.isDeviceMotionAvailable else { return }
        manager.deviceMotionUpdateInterval = 1.0 / 60.0 // 60 Hz

        manager.startDeviceMotionUpdates(to: .main) { motion, _ in
            guard let motion = motion else { return }

            let accelY = motion.userAcceleration.y

            let now = Date()
            if accelY > self.threshold && now.timeIntervalSince(self.lastLaunchTime) > self.cooldown {
                self.lastLaunchTime = now
                onLaunch(true)
            }
        }
    }

    func stop() {
        manager.stopDeviceMotionUpdates()
    }
}
