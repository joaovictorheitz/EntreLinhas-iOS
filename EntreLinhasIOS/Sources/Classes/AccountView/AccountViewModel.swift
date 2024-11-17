//
//  AccountViewModel.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 17/11/24.
//

import Foundation

class AccountViewModel: ObservableObject {
    
    private var coordinator: Coordinator?
    
    func onAppear(coordinator: Coordinator) {
        self.coordinator = coordinator
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
}
