//
//  SignUpViewModel.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 17/11/24.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    // MARK: - Coordinator
    
    private var coordinator: Coordinator?
    
    // MARK: - Supabase Manager
    
    private var supabaseManager = SupabaseManager.shared
    
    // MARK: - Proprieties
    
    @Published var email = ""
    @Published var password1 = ""
    @Published var password2 = ""
    
    @Published var checkBoxSeamtress = false { didSet {
        userType = checkBoxSeamtress ? .seamstress : .consumer
    }}
    
    private var userType: UserRole = .consumer
    
    // MARK: - On Appear
    
    func onAppear(coordinator: Coordinator) {
        self.coordinator = coordinator
    }
    
    func signUpAction() {
        Task {
            try await supabaseManager.signUp(email: email, password: password1, role: userType)
            
            popToLogin()
        }
    }
    
    private func popToLogin() {
        coordinator?.popToRoot()
    }
}
