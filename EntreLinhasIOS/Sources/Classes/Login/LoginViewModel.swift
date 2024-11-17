//
//  LoginViewModel.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import Foundation
import Supabase
import SwiftUI

public class LoginViewModel: ObservableObject {
    
    // MARK: - Credentials
    
    @Published var email: String
    @Published var password: String
    
    // MARK: - Error Message Vars
    
    @Published var showErrorMessage = false
    var errorMessage: String?
    
    // MARK: - Supabase
    
    var supabaseManager: SupabaseManager = SupabaseManager.shared
    
    // MARK: - Init
    
    public init() {
        self.email = ""
        self.password = ""
    }
    
    // MARK: - On Appear
    
    func onAppear() {
        
    }
    
    // MARK: - Login Action
    
    func loginAction() {
        Task {
            do {
                try await supabaseManager.login(email: email, password: password)
            } catch {
                setErrorMessage(error)
                showErrorMessage(true)
            }
        }
    }
    
    // MARK: - API Key
    
    private func getAPIKey() -> String? {
        guard let path = Bundle.main.path(forResource: "Config", ofType: "plist") else {
            print("Arquivo Config.plist não encontrado.")
            return nil
        }

        guard let plist = NSDictionary(contentsOfFile: path) else {
            print("Não foi possível ler o conteúdo do arquivo.")
            return nil
        }
                   
        let APIKey = plist["API_KEY"] as? String
        
        return APIKey
    }
    
    // MARK: - Error Message
    
    private func showErrorMessage(_ value: Bool) {
        DispatchQueue.main.async {
            self.showErrorMessage = value
        }
    }
    
    private func setErrorMessage(_ error: Error) {
        switch error.localizedDescription {
        case "Invalid login credentials":
            errorMessage = EntreLinhasIOSStrings.invalidCredentialsErrorMessage
        default:
//            errorMessage = EntreLinhasIOSStrings.unknowedErrorMessage
            errorMessage = error.localizedDescription
        }
    }
}
