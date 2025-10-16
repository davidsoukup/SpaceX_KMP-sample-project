//
//  RocketDetailSuccessView.swift
//  iosApp
//
//  Created by David Soukup on 15.10.2025.
//

import Shared
import SwiftUI

struct RocketDetailSuccessView: View {
    var rocketDetail: RocketDetailModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.medium) {
                RocketDetailDesriptionSection(
                    description: rocketDetail.description_
                )
                
                RocketDetailParametersSection(
                    heightFormatted: rocketDetail.height.metersFormated,
                    diameterFormatted: rocketDetail.diameter.metersFormated,
                    massFormatted: rocketDetail.mass.tonsFormatted,
                    stages: rocketDetail.stages
                )
                
                RocketDetailPhotosSection(
                    photosUrl: rocketDetail.images
                )
            }
            .padding(.vertical, Spacing.Screen.vertical)
            .padding(.horizontal, Spacing.Screen.horizontal)
        }
    }
}

