//
//  ServicesView.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        VStack {
            HStack (spacing: 16) {
                Button(action: {}, label: {
                    Image(systemName: "line.horizontal.3")
                        .resizable()
                        .frame(width: 32, height:  32)
                        .foregroundStyle(Color.white)
                })
                
                Text("Serviços")
                    .font(.system(size: 36, weight: .light))
                    .foregroundStyle(Color.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(24)
        .background(EntreLinhasIOSAsset.Assets.caribbeanCurrent.swiftUIColor)
    }
}

#Preview {
    ServicesView()
}
