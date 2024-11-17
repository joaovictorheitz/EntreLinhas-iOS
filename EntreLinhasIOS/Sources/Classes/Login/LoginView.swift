//
//  LoginView.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import SwiftUI

public struct LoginView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    @StateObject var viewModel = LoginViewModel()
    
    public var body: some View {
        VStack (spacing: 0) {
            Text(EntreLinhasIOSStrings.appTitle)
                .font(.system(size: 24))
                .padding(24)
            
            VStack (spacing: 0) {
                TextField(EntreLinhasIOSStrings
                    .loginEmailPlaceHolder, text: $viewModel.email)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
                                        
                SecureField(EntreLinhasIOSStrings
                    .loginPasswordPlaceHolder, text: $viewModel.password)
                    .textFieldStyle(.roundedBorder)
                    .padding(8)
            }
            .padding(8)
            
            VStack {
                HStack {
                    Button(
                        action: viewModel.loginAction,
                        label: {
                            Text(EntreLinhasIOSStrings.loginButtonTitle)
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, maxHeight: 42)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    )
                    .padding(8)
                }
                
                if viewModel.showErrorMessage, let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundStyle(.red)
                }
            }
            .padding(8)
        }
        .onAppear {
            viewModel.onAppear(coordinator: coordinator)
        }
    }
}

#Preview {
    LoginView()
}
