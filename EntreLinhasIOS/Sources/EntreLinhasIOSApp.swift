import SwiftUI

@main
struct EntreLinhasIOSApp: App {
    let supabaseManager = SupabaseManager.shared
    
    var screen: Screen = .login
    
    init() {
        guard let jwt = supabaseManager.loadJWT() else { return }
        
        do {
            try supabaseManager.retrieveSession(jwt: jwt)
            
            screen = .home
        } catch {
            screen = .login
        }
    }
    
    var body: some Scene {
        WindowGroup {
            switch self.screen {
            case .login:
                LoginView()
            default:
                MainView()
            }
        }
    }
}

enum Screen {
    case account, login, home, services
}
