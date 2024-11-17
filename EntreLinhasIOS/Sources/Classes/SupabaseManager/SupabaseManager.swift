//
//  SupabaseManager.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import Foundation
import Supabase

class SupabaseManager {
    
    // MARK: - Shared
    
    public static var shared = SupabaseManager()

    // MARK: - Proprieties
    
    var supabaseClient: SupabaseClient?
    
    public init() {
        initSupabaseClient()
    }
    
    // MARK: - Public Functions
    
    public func isLoggedIn() async -> Bool {
        do {
            return try await supabaseClient?.auth.session.accessToken != nil
        } catch {
            print("\(error)")
            return false
        }
    }
    
    public func login(email: String, password: String) async throws {
        try await supabaseClient?.auth.signIn(email: email, password: password)
        
        guard let token = try await supabaseClient?.auth.session.accessToken else { return }
        
        saveJWT(token: token)
    }
    
    public func signOut() {
        Task {
            try await supabaseClient?.auth.signOut()
        }
    }
    
    public func retrieveSession(jwt: String) throws {
        Task {
            try await supabaseClient?.auth.refreshSession(refreshToken: jwt)
        }
    }
    
    // MARK: - Private Funcitons
    
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
    
    private func saveJWT(token: String) {
        let data = token.data(using: .utf8)!
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "userJWT",
            kSecValueData as String: data
        ]
        
        SecItemDelete(query as CFDictionary)
                        
        let status = SecItemAdd(query as CFDictionary, nil)
        
        if status == errSecSuccess {
            print("JWT stored with success!")
        }
    }
    
    func loadJWT() -> String? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: "userJWT",
            kSecReturnData as String: kCFBooleanTrue!,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var dataTypeRef: AnyObject? = nil
        let status: OSStatus = SecItemCopyMatching(query as CFDictionary, &dataTypeRef)
        
        if status == errSecSuccess {
            if let data = dataTypeRef as? Data {
                return String(data: data, encoding: .utf8)
            }
        }
        return nil
    }
}
