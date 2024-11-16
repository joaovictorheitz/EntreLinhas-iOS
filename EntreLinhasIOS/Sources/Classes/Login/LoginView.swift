//
//  LoginView.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import SwiftUI

public struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    
    public var body: some View {
        VStack (spacing: 0) {
            Text("Entre-Linhas")
                .font(.system(size: 24))
                .padding(24)
            
            VStack (spacing: 0) {
                TextField("E-mail", text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                                        
                SecureField("Senha", text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
            }
            .padding(8)
            
            HStack {
                Button(
                    action: {},
                    label: {
                        Text("Acessar")
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .frame(maxWidth: .infinity, maxHeight: 42)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                )
                .padding(8)
            }
            .padding(8)
        }
    }
}

#Preview {
    LoginView()
}
