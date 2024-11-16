//
//  HomeView.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            Text("Home View")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(EntreLinhasIOSAsset.Assets.ashGray.swiftUIColor)
    }
}

#Preview {
    HomeView()
}
