//
//  RocketDetailPhotosSection.swift
//  iosApp
//
//  Created by David Soukup on 16.10.2025.
//

import SwiftUI

struct RocketDetailPhotosSection: View {
    var photosUrl: [String]
    var maxVisiblePhotos: Int = 2
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.medium) {
            Text("Photos")
                .modifier(Title2Bold(color: Color.black))
            
            ForEach(photosUrl.prefix(maxVisiblePhotos), id: \.self) { photoUrl in
                if let url = URL(string: photoUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(12)
                    } placeholder: {
                        ProgressView()
                    }
                    .padding(.vertical, 4)
                }
            }
        }
    }
}
