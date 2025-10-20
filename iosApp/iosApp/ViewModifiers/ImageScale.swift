//
//  ImageScale.swift
//  iosApp
//
//  Created by David Soukup on 21.10.2025.
//

import SwiftUI

struct ImageScrollScale: ViewModifier {
    @State private var frame: CGRect = .zero
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(scaleFactor, anchor: .bottom)
            .overlay {
                GeometryReader { proxy in
                    let f = proxy.frame(in: .named("container"))
                    Color.clear
                        .onAppear { frame = f }
                        .onChange(of: f) { _, newValue in
                            frame = newValue
                        }
                }
            }
    }
    
    private var scaleFactor: CGFloat {
        if frame.minY > 0 {
            // Normal scaling when scrolling up
            return max(1, 1 + (abs(frame.minY) / frame.height))
        } else {
            // Slow scaling when scrolling down, max at 1.2, ensuring it's never below 1
            return max(1, min(1.2, 1 + (frame.minY / (frame.height * 7)))) // Adjust divisor for slower scaling
        }
    }
}

extension View {
    func scaleImageInScrol() -> some View {
        modifier(ImageScrollScale())
    }
}
