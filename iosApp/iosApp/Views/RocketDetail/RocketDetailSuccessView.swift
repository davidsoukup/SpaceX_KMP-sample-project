//
//  RocketDetailSuccessView.swift
//  iosApp
//
//  Created by David Soukup on 20.10.2025.
//

import Shared
import SwiftUI

struct RocketDetailSuccessView: View {
    @EnvironmentObject private var viewModel: RocketDetailVM
    @Environment(\.presentToast) var presentToast
    
    var rocketDetail: RocketDetailModel
    
    let imageHeight: CGFloat = 250
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Spacing.large) {
                // Base info
                VStack(alignment: .leading, spacing: Spacing.small) {
                    Text(rocketDetail.name)
                        .modifier(Title1Bold(color: Color.text))
                    
                    HStack {
                        Image("us")
                            .resizable()
                            .frame(width: 16, height: 16)
                        
                        Text(rocketDetail.country)
                            .modifier(CalloutMedium(color: Color.text))
                    }
                }
                
                // Description
                Text(rocketDetail.description_)
                    .modifier(BodyRegular(color: Color.text))
                
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
            .padding(.horizontal, Spacing.Screen.horizontal)
            .padding(.top, Spacing.Screen.vertical * 2) // Vertical padding + vertical padding of image
            .frame(maxWidth: .infinity)
            .background(alignment: .top) {
                VStack {
                    if let headerImageUrl = rocketDetail.images.first {
                        NetworkImage(imageUrl: headerImageUrl)
                            .frame(height: imageHeight)
                    }
                    Spacer()
                }
                .cornerRadius(16)
                .padding(.top, -(imageHeight - Spacing.Screen.vertical))
            }
            .padding(.top, imageHeight)
        }
        .background(Color.background.ignoresSafeArea())
        .refreshable {
            viewModel.refresh()
        }
        .collect(flow: viewModel.effect) { effect in
            switch onEnum(of: effect) {
            case .detailRefreshed:
                presentToast(Toasts.RefreshSuccessfull)
            case .detailRefreshFailed:
                presentToast(Toasts.RefreshFailed)
            }
        }
    }
}
