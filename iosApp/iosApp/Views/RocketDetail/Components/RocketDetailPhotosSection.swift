//
//  RocketDetailPhotosSection.swift
//  iosApp
//
//  Created by David Soukup on 16.10.2025.
//

import SwiftUI

struct RocketDetailPhotosSection: View {
    var photosUrl: [String]
    var maxVisiblePhotos: Int = 5
    
    private let imageWidth = UIScreen.main.bounds.width - (2 * Spacing.Screen.horizontal)
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            Text("Photos")
                .modifier(Title2Bold(color: Color.text))
                .padding(.leading, Spacing.Screen.horizontal)
            
            ScrollView(.horizontal) {
                HStack(spacing: Spacing.small) {
                    ForEach(photosUrl.prefix(maxVisiblePhotos), id: \.self) { photoUrl in
                        NetworkImage(imageUrl: photoUrl)
                            .scaledToFill()
                            .frame(width: imageWidth, height: imageWidth / 2)
                            .cornerRadius(12)
                    }
                }
                .scrollTargetLayout()
            }
            .safeAreaPadding(.horizontal, Spacing.Screen.horizontal)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)
        }
        .padding(.horizontal, -Spacing.Screen.horizontal)
    }
}
