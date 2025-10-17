//
//  ErrorStateView.swift
//  iosApp
//
//  Created by David Soukup on 17.10.2025.
//

import SwiftUI

struct ErrorStateView: View {
    var onTryAgain: () -> Void
    
    var body: some View {
        VStack(spacing: Spacing.medium) {
            Text("Oops...")
                .modifier(LargeTitle(color: .accentColor))
            
            VStack(spacing: Spacing.large) {
                Text("Someting went wrong...")
                    .modifier(BodyRegular(color: .text))
                
                Image("Error")
                    .resizable()
                    .frame(width: 140, height: 140)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.accentColor, lineWidth: 2)
                    )
                
                Button("Try again") {
                    onTryAgain()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .frame(maxWidth: .infinity)
        .padding(Spacing.xLarge)
        .background(Color.text.opacity(0.1))
        .cornerRadius(12)
    }
}
