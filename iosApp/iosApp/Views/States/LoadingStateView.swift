//
//  LoadingStateView.swift
//  iosApp
//
//  Created by David Soukup on 17.10.2025.
//

import SwiftUI

struct LoadingStateView: View {
    var body: some View {
        ProgressView("Loading...")
            .frame(width: 120, height: 120, alignment: .center)
            .modifier(Textsm(color: .text))
        .   tint(.accentColor)
    }
}
