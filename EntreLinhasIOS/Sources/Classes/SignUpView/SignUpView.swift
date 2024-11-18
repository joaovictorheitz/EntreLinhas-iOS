//
//  SignUpView.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 17/11/24.
//

import SwiftUI
import CustomTextField

struct SignUpView: View {
    @EnvironmentObject var coordinator: Coordinator
    
    @StateObject var viewModel = SignUpViewModel()
    
    var body: some View {
        ZStack {
            Color(EntreLinhasIOSAsset.Assets.caribbeanCurrent.swiftUIColor)
            
            VStack(spacing: 0) {
                EntreLinhasIOSAsset.Assets.logo.swiftUIImage
                    .resizable()
                    .frame(width: 245, height: 270)
                
                VStack (spacing: 29) {
                    EGTextField(text: $viewModel.email)
                        .setBackgroundColor(Color(red: 163 / 255, green: 187 / 255, blue: 173 / 255, opacity: 0.4))
                        .setBorderWidth(0.0)
                        .setPlaceHolderText(EntreLinhasIOSStrings.signUpEmailPlaceHolder)
                        .setPlaceHolderTextColor(Color.white)
                        .setCornerRadius(20.0)
                        .setTextColor(.white)
                        .setTextFieldHeight(32)
                    
                    EGTextField(text: $viewModel.password)
                        .setPlaceHolderText(EntreLinhasIOSStrings.signUpPasswordPlaceHolder1)
                        .setPlaceHolderTextColor(Color.white)
                        .setCornerRadius(20.0)
                        .setBackgroundColor(Color(red: 163 / 255, green: 187 / 255, blue: 173 / 255, opacity: 0.4))
                        .setBorderWidth(0.0)
                        .setSecureText(true)
                        .setTextColor(.white)
                        .setTextFieldHeight(32)
                    
                    EGTextField(text: $viewModel.password)
                        .setPlaceHolderText(EntreLinhasIOSStrings.signUpPasswordPlaceHolder2)
                        .setPlaceHolderTextColor(Color.white)
                        .setCornerRadius(20.0)
                        .setBackgroundColor(Color(red: 163 / 255, green: 187 / 255, blue: 173 / 255, opacity: 0.4))
                        .setBorderWidth(0.0)
                        .setSecureText(true)
                        .setTextColor(.white)
                        .setTextFieldHeight(32)
                        
                }
                .padding(20)
                
                HStack {
                    Button(
                        action: viewModel.signUpAction,
                        label: {
                            Text(EntreLinhasIOSStrings.signUpButtonTitle)
                                .font(.system(size: 16, weight: .bold, design: .default))
                                .frame(maxWidth: .infinity, maxHeight: 42)
                                .foregroundColor(Color.white)
                                .background(Color.black)
                                .cornerRadius(15)
                        }
                    )
                    .padding(12)
                }
                
                Toggle(isOn: $viewModel.userSeamstress, label: {
                    Label(title: {
                        Text(EntreLinhasIOSStrings.signUpCheckBoxUserSeamstress)
                            .tint(.white)
                    }, icon: {})
                })
                .toggleStyle(iOSCheckboxToggleStyle())
                .padding(12)
            }
        }
        .ignoresSafeArea()
        .onAppear {
            viewModel.onAppear(coordinator: coordinator)
        }
    }
}
struct iOSCheckboxToggleStyle: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack (spacing: 5) {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .tint(.black)

                configuration.label
            }
        })
    }
}

#Preview {
    SignUpView()
        .environmentObject(Coordinator())
}
