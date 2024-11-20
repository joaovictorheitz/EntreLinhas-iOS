//
//  ServiceItem.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 20/11/24.
//

import SwiftUI

struct ServiceItem: View {
    let image: Image
    let title: String
    let description: String
    
    var body: some View {
        HStack {
            image
                .resizable()
                .foregroundStyle(.white)
                .frame(width: 45, height: 45)
            
            VStack (alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundStyle(Color.white)
                
                Text(description)
                    .font(.system(size: 10, weight: .medium))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(Color.gray)
                    .lineLimit(nil)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black
        
        ServiceItem(image: Image(systemName: "pencil.circle.fill"), title: "Pequenos ajustes", description: "Realizamos pequenos ajustes nas suas roupas")
    }
}
