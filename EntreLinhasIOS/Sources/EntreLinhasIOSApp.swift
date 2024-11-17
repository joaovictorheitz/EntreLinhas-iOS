import SwiftUI

@main
struct EntreLinhasIOSApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
        }
    }
}

enum Screen {
    case account, login, home, services
}
