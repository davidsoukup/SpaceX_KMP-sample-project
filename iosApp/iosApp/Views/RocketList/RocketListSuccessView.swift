//
//  RocketListDetailView.swift
//  iosApp
//
//  Created by David Soukup on 15.10.2025.
//

import SwiftUI
import Shared

struct RocketListSuccessView: View {
    var rockets: [RocketListModel]
    
    var body: some View {
        List(rockets, id: \.id) { rocket in
            NavigationLink(value: AppRoute.rocketDetail(rocketId: rocket.id, rocketName: rocket.name)) {
                RocketRow(rocket: rocket)
            }
        }
        .navigationTitle("Rockets")
    }
}

struct RocketRow: View {
    var rocket: RocketListModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image(systemName: "paperplane.fill")
                .resizable()
                .frame(width: 28, height: 28)
                .foregroundStyle(rocket.active ? Color.pink : Color.gray)
            VStack(alignment: .leading) {
                Text(rocket.name)
                    .font(.system(size: 24, weight: .bold))
                Text("First flight: \(rocket.firstFlight)")
                    .font(.system(size: 12, weight: .medium))
            }
            
            
            Spacer()
        }
    }
}
