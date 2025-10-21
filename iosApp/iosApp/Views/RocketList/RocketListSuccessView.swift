//
//  RocketListDetailView.swift
//  iosApp
//
//  Created by David Soukup on 15.10.2025.
//

import SwiftUI
import Shared
import Toasts

struct RocketListSuccessView: View {
    @EnvironmentObject private var viewModel: RocketListVM
    @Environment(\.presentToast) var presentToast
    
    var rockets: [RocketListModel]
    
    var body: some View {
        List(rockets, id: \.id) { rocket in
            NavigationLink(value: AppRoute.rocketDetail(rocketId: rocket.id, rocketName: rocket.name)) {
                RocketRow(rocket: rocket)
            }
        }
        .navigationTitle("Rockets")
        .refreshable {
            viewModel.refresh()
        }
        .collect(flow: viewModel.effect) { effect in
            switch onEnum(of: effect) {
            case .listRefreshed:
                presentToast(Toasts.RefreshSuccessfull)
            case .listRefreshFailed:
                presentToast(Toasts.RefreshFailed)
            }
        }
    }
}

struct RocketRow: View {
    var rocket: RocketListModel
    
    var body: some View {
        HStack(spacing: 12) {
            Image("Rocket")
                .resizable()
                .frame(width: 24, height: 24)
                .foregroundStyle(rocket.active ? Color.pink : Color.gray)
            
            VStack(alignment: .leading) {
                Text(rocket.name)
                    .modifier(Title2Bold(color: Color.text))
                Text("First flight: \(rocket.firstFlight)")
                    .modifier(FootnoteRegular(color: Color.text))
            }
            
            Spacer()
        }
    }
}
