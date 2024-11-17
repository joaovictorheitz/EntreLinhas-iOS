//
//  LoginViewModel.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import Foundation
import Supabase

public class LoginViewModel: ObservableObject {
    @Published var email: String
    @Published var password: String
    
    // MARK: - Error Message
    
    @Published var showErrorMessage = false
    var errorMessage: String?
    
    var supabaseClient: SupabaseClient?
    
    public init() {
        self.email = ""
        self.password = ""
    }
    
    func onAppear() {
        initSupabaseClient()
    }
    
    func loginAction() {
        Task {
            do {
                try await supabaseClient?.auth.signIn(email: email, password: password)
            } catch {
                errorMessage = error.localizedDescription
                showErrorMessage(true)
            }
        }
    }
    
    private func initSupabaseClient() {
        guard let supabaseURL = URL(string: APPConstants.Supabase.projectURL), let apiKey = getAPIKey() else { return }
        
        supabaseClient = SupabaseClient(supabaseURL: supabaseURL, supabaseKey: apiKey)
    }
    
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
