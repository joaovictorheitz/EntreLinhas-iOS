//
//  AccountView.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import SwiftUI

struct AccountView: View {
    var body: some View {
        Text("Account View")
        
        Button(
            action: {
                let supabaseManager = SupabaseManager.shared
                
                supabaseManager.signOut()
            },
            label: {
                Text(EntreLinhasIOSStrings.signOutButtonTitle)
                    .font(.system(size: 16, weight: .bold, design: .default))
                    .frame(maxWidth: .infinity, maxHeight: 42)
                    .foregroundColor(Color.white)
                    .background(Color.red)
                    .cornerRadius(10)
            }
        )
        .padding(8)
    }
}

#Preview {
    AccountView()
}
