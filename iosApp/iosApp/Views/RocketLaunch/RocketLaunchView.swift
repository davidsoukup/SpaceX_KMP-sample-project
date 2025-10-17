//
//  RocketLaunchView.swift
//  iosApp
//
//  Created by David Soukup on 16.10.2025.
//

import CoreMotion
import SwiftUI
import UIKit

struct RocketLaunchView: View {
    @StateObject private var motionManager = RocketLaunchMotionManager()
    @State private var rocketOffset: CGFloat = 0
    @State private var isFlying: Bool = false
    
    var rocketName: String

    var body: some View {
        VStack(spacing: Spacing.xLarge) {
            Spacer()
            Image(isFlying ? "RocketFlying" : "RocketIdle")
                .resizable()
                .scaledToFit()
                .frame(width: 140)
                .offset(y: rocketOffset)
            
            #if targetEnvironment(simulator)
            VStack(spacing: Spacing.medium) {
                Text(isFlying ? "Launch successfull 🚀" : "Tap on button to launch the rocket 🆙")
                    .modifier(BodyBold(color: Color.text))
                
                Button("Launch rocket") {
                    launchRocket()
                }
                .buttonStyle(.bordered)
                .disabled(isFlying)
            }
            #else
            Text(isFlying ? "Launch successfull 🚀" : "Move your phone up to launch the rocket 🆙")
                .modifier(BodyBold(color: Color.text))
            #endif

        }
        .padding(.bottom, 60)
        .onAppear {
            motionManager.startMonitoring { launched in
                if launched {
                    launchRocket()
                }
            }
        }
        .onDisappear { motionManager.stop() }
        .navigationTitle("\(rocketName) launch")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func launchRocket() {
        let generator = UIImpactFeedbackGenerator(style: .heavy)
        generator.prepare()
        
        let flightDuration: TimeInterval = 1.5
        
        
        isFlying = true
        
        withAnimation(.easeIn(duration: flightDuration)) {
            rocketOffset = -(UIScreen.main.bounds.height)
        } completion: {
            withAnimation(.easeOut(duration: flightDuration)) {
                rocketOffset = 0
            } completion: {
                isFlying = false
            }
        }

        // Vibrations
        let pulseInterval: TimeInterval = 0.1
        var elapsed: TimeInterval = 0

        _ = Timer.scheduledTimer(withTimeInterval: pulseInterval, repeats: true) { timer in
            generator.impactOccurred()
            elapsed += pulseInterval
            // Flight + fall
            if elapsed >= (flightDuration * 2) {
                timer.invalidate()
            }
        }
    }
}
