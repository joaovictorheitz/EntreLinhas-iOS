//
//  EntreLinhasButton.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 20/11/24.
//

import SwiftUI

struct EntreLinhasButton: View {
    let action: () -> Void
    let title: String
    
    var body: some View {
        Button(
            action: action,
            label: {
                Text(title)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, maxHeight: 42)
                    .foregroundColor(Color.white)
                    .background(Color.black)
                    .cornerRadius(15)
            }
        )
    }
}

#Preview {
    EntreLinhasButton(action: {}, title: "EntreLinhasButton")
}
