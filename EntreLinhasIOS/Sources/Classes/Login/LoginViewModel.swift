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
    
    var supabaseClient: SupabaseClient?
    
    public init() {
        self.email = ""
        self.password = ""
    }
    
    func onAppear() {
        initSupabaseClient()
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
}
