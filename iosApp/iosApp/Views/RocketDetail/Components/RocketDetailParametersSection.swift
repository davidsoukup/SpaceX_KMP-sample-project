//
//  RocketDetailParametersSection.swift
//  iosApp
//
//  Created by David Soukup on 16.10.2025.
//

import Shared
import SwiftUI

struct RocketDetailParametersSection: View {
    var heightFormatted: String
    var diameterFormatted: String
    var massFormatted: String
    var stages: [RocketStageModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            Text("Parameters")
                .modifier(Title2Bold(color: Color.text))
            
            HStack {
                RocketDetailParameterCard(
                    title: "Height",
                    value: heightFormatted
                )
                Spacer()
                
                RocketDetailParameterCard(
                    title: "Diameter",
                    value: diameterFormatted
                )
                
                Spacer()
                
                RocketDetailParameterCard(
                    title: "Mass",
                    value: massFormatted
                )
            }
            
            ForEach(Array(stages.enumerated()), id: \.offset) { index, stage in
                VStack(alignment: .leading, spacing: Spacing.small) {
                    RocketDetailStageCard(
                        stage: stage,
                        stageIndex: index
                    )
                }
            }
        }
    }
}

private struct RocketDetailParameterCard: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(spacing: Spacing.xSmall) {
            
            Text(value)
                .modifier(Title2Bold(color: Color.white))
                .lineLimit(1)
            
            Text(title)
                .modifier(Subheadline(color: Color.white))
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.purple)
        .cornerRadius(12)
    }
}

private struct RocketDetailStageCard: View {
    var stage: RocketStageModel
    var stageIndex: Int
    
    private func stageTitle(stageIndex: Int) -> String {
        switch stageIndex {
        case 0: return "First stage"
        case 1: return "Second stage"
        case 2: return "Third stage"
        default: return "Stage \(stageIndex + 1)"
        }
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            Text(stageTitle(stageIndex: stageIndex))
                .modifier(Title2Bold(color: Color.text))
            
            RocketDetailStageInfoRow(
                icon: "Reusable",
                text: stage.reusable ? "Reusable" : "Not reusable"
            )
            
            RocketDetailStageInfoRow(
                icon: "Engine",
                text: "\(stage.engines) engines"
            )
            
            RocketDetailStageInfoRow(
                icon: "Fuel",
                text: "\(SharedNumberFormatter().maxTwoDecimals(double: stage.fuelAmountTons)) tons of fuel"
            )
            
            if let burnTimeSec = stage.burnTimeSec {
                RocketDetailStageInfoRow(
                    icon: "Burn",
                    text: "\(burnTimeSec) seconds burn time"
                )
            }
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.text.opacity(0.05))
        .cornerRadius(12)
    }
}

private struct RocketDetailStageInfoRow: View {
    var icon: String
    var text: String
    
    var body: some View {
        HStack(spacing: Spacing.small) {
            Image(icon)
                .resizable()
                .scaledToFit()
                .frame(height: 16)
            
            Text(text)
                .modifier(BodyRegular(color: Color.text))
            
            Spacer()
        }
    }
}


