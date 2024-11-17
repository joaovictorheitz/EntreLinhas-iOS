//
//  AccountViewModel.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 17/11/24.
//

import Foundation
import Supabase

class AccountViewModel: ObservableObject {
    
    // MARK: - Coordinator
    
    private var coordinator: Coordinator?
    
    // MARK: - Supabase
    
    private var supabaseManager: SupabaseManager = SupabaseManager.shared
    private var user: User?
    
    @Published var userRole: UserRole?
    
    // MARK: - On Appear
    
    func onAppear(coordinator: Coordinator) {
        self.coordinator = coordinator
        
        updateUser()
        setupUserRole()
    }
    
    func logoutAction() {
        logoutSupabase()
        pushLoginPage()
    }
    
    private func logoutSupabase() {
        let supabaseManager = SupabaseManager.shared
        
        supabaseManager.signOut()
    }
    
    private func pushLoginPage() {
        coordinator?.popToRoot()
    }
    
    private func updateUser() {
        Task {
            user = try await supabaseManager.user
        }
    }
    
    private func setupUserRole() {
        guard let userRole = user?.userMetadata["role"]?.stringValue else { return }
        
        switch userRole {
        case UserRole.consumer.rawValue:
            self.userRole = .consumer
        case UserRole.seamstress.rawValue:
            self.userRole = .seamstress
        default:
            self.userRole = .consumer
        }
    }
}
