//
//  RocketDetailDescriptionSection.swift
//  iosApp
//
//  Created by David Soukup on 16.10.2025.
//

import SwiftUI

struct RocketDetailDesriptionSection: View {
    var description: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.small) {
            Text("Overview")
                .modifier(Title2Bold(color: Color.black))
            
            Text(description)
                .modifier(BodyRegular(color: Color.black))
        }
    }
}
