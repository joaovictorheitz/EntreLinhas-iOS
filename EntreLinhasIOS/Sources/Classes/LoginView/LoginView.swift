//
//  LoginView.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import SwiftUI
import CustomTextField

public struct LoginView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    @StateObject var viewModel = LoginViewModel()
    
    public var body: some View {
        ZStack {
            Color(EntreLinhasIOSAsset.Assets.caribbeanCurrent.swiftUIColor)
            
            VStack (spacing: 0) {
                EntreLinhasIOSAsset.Assets.logo.swiftUIImage
                    .resizable()
                    .frame(width: 245, height: 270)
                                
                VStack (spacing: 0) {
                    EGTextField(text: $viewModel.email)
                        .setBackgroundColor(Color(red: 163 / 255, green: 187 / 255, blue: 173 / 255, opacity: 0.4))
                        .setBorderWidth(0.0)
                        .setPlaceHolderText(EntreLinhasIOSStrings.loginEmailPlaceHolder)
                        .setPlaceHolderTextColor(Color.white)
                        .setCornerRadius(20.0)
                        .setTextColor(.white)
                        .setTextFieldHeight(32)
                        .padding(8)
                    
                    EGTextField(text: $viewModel.password)
                        .setPlaceHolderText(EntreLinhasIOSStrings.loginPasswordPlaceHolder)
                        .setPlaceHolderTextColor(Color.white)
                        .setCornerRadius(20.0)
                        .setBackgroundColor(Color(red: 163 / 255, green: 187 / 255, blue: 173 / 255, opacity: 0.4))
                        .setBorderWidth(0.0)
                        .setSecureText(true)
                        .setTextColor(.white)
                        .setTextFieldHeight(32)
                    
                        .padding(8)
                        
                }
                .padding(20)
                
                VStack {
                    HStack {
                        Button(
                            action: viewModel.loginAction,
                            label: {
                                Text(EntreLinhasIOSStrings.loginButtonTitle)
                                    .font(.system(size: 16, weight: .bold, design: .default))
                                    .frame(maxWidth: .infinity, maxHeight: 42)
                                    .foregroundColor(Color.white)
                                    .background(Color.black)
                                    .cornerRadius(15)
                            }
                        )
                        .padding(12)
                    }
                                                            
                    Button(action: viewModel.routeToSignUpPage, label: {
                        Text(EntreLinhasIOSStrings.loginCreateAccountLabel)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 16, weight: .bold, design: .default))
                            .padding(5)
                    })
                    
                    Text(EntreLinhasIOSStrings.loginRecoverPasswordLabel)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 16, weight: .bold, design: .default))
                        .padding(5)
                    
                    if viewModel.showErrorMessage, let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundStyle(.red)
                    }
                }
                .padding(20)
            }
        }
        .onAppear {
            viewModel.onAppear(coordinator: coordinator)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    LoginView()
        .environment(Coordinator())
}
