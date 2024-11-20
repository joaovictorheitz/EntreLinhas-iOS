//
//  ServicesView.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import SwiftUI

struct ServicesView: View {
    var body: some View {
        ZStack {
            EntreLinhasIOSAsset.Assets.ashGray.swiftUIColor
                .ignoresSafeArea()
            
            VStack {
                VStack {
                    HStack (spacing: 16) {
                        Button(action: {}, label: {
                            Image(systemName: "line.horizontal.3")
                                .resizable()
                                .frame(width: 32, height:  32)
                                .foregroundStyle(Color.white)
                        })
                        
                        Text(EntreLinhasIOSStrings.servicesHeaderTitle)
                            .font(.system(size: 36, weight: .light))
                            .foregroundStyle(Color.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(24)
                .background(EntreLinhasIOSAsset.Assets.caribbeanCurrent.swiftUIColor)
                
                Text(EntreLinhasIOSStrings.serviceChooseServiceLabel)
                    .padding(12)
                    .font(.system(size: 22, weight: .regular))
                    .foregroundStyle(Color.white)
                
                Text("Go more places and get more local favorites,")
                    .padding(12)
                    .font(.system(size: 16, weight: .regular))
                    .foregroundStyle(Color.white)
                
                VStack (alignment: .leading, spacing: 16) {
                    ServiceItem(image: EntreLinhasIOSAsset.Assets.servicoPequenosAjustes.swiftUIImage, title: EntreLinhasIOSStrings.serviceMinorFixesTitle, description: EntreLinhasIOSStrings.serviceMinorFixesDescription)
                    
                    ServiceItem(image:  EntreLinhasIOSAsset.Assets.servicoNovasPecas.swiftUIImage, title: EntreLinhasIOSStrings.serviceNewPiecesTitle, description: EntreLinhasIOSStrings.serviceNewPiecesTitle)
                    
                    ServiceItem(image: EntreLinhasIOSAsset.Assets.servicoRestauracao.swiftUIImage, title: EntreLinhasIOSStrings.serviceRestorationTitle, description: EntreLinhasIOSStrings.serviceRestorationDescription)
                }
                .padding(12)
                
                Spacer()
                
                HStack {
                    Button(
                        action: {},
                        label: {
                            Text(EntreLinhasIOSStrings.serviceScheduleLabel)
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, maxHeight: 42)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .cornerRadius(15)
                        }
                    )
                    .padding(12)
                }
            }
        }
        
    }
}

#Preview {
    ServicesView()
}
