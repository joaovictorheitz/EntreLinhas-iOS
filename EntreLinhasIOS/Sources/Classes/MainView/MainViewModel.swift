//
//  MainViewModel.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 17/11/24.
//

import Foundation
import SwiftUICore

class MainViewModel: ObservableObject {
    
    // MARK: - Coordinator
    
    var coordinator: Coordinator?
    
    // MARK: - Supabase
    
    var supabaseManager: SupabaseManager = SupabaseManager.shared
    
    // MARK: -
    
    @Published var tabSelection = 0
    
    // MARK: - Init
    
//    init(coordinator: Coordinator) {
//        self.coordinator = coordinator
//    }
    
    // MARK: - On Appear
    
    func onAppear(coordinator: Coordinator) {
        setupCoordinator(coordinator)
    }
    
    // MARK: - Private Functions
    
    private func setupCoordinator(_ coordinator: Coordinator) {
        self.coordinator = coordinator
    }
}
