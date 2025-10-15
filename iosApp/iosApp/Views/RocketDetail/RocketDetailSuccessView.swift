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
        Text(rocketDetail.name)
    }
}
