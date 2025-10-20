//
//  NetworkImage.swift
//  iosApp
//
//  Created by David Soukup on 21.10.2025.
//

import SwiftUI

struct NetworkImage: View {
    var imageUrl: String
    
    var body: some View {
        if let url = URL(string: imageUrl) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
            } placeholder: {
                Color.gray
            }
        }
    }
}
