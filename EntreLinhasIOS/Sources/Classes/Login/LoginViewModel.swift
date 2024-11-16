//
//  LoginViewModel.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import Foundation

public class LoginViewModel: ObservableObject {
    @Published var email: String
    @Published var password: String
    
    public init() {
        self.email = ""
        self.password = ""
    }
}
