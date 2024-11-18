//
//  SignUpViewModel.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 17/11/24.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    // MARK: - Coordinator
    
    var coordinator: Coordinator?
    
    // MARK: - Proprieties
    
    @Published var email = ""
    @Published var password = ""
    
    @Published var userSeamstress = false
    
    // MARK: - On Appear
    
    func onAppear(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func signUpAction() {
        
    }
}
