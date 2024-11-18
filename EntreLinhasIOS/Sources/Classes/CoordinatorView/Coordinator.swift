    //
    //  Coordinator.swift
    //  EntreLinhasIOS
    //
    //  Created by João Victor de Souza Guedes on 17/11/24.
    //

    import Foundation
    import SwiftUI

class Coordinator: ObservableObject, Observable {
    @Published var path: NavigationPath = NavigationPath()
    @Published var fullScreenCover: FullScreenCover?
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .main: MainView()
        case .login: LoginView()
        case .signUp: SignUpView()
        }
    }
    
//    @ViewBuilder
//    func buildSheet(sheet: Sheet) -> some View {
//        switch sheet {
//        case .forgotPassword: ForgotPasswordView()
//        }
//    }
    
//    @ViewBuilder
//    func buildCover(cover: FullScreenCover) -> some View {
//        switch cover {
//        case .signup: SignupView()
//        }
////    }
    
    func push(page: AppPages) {
        DispatchQueue.main.async {
            self.path.append(page)
        }
    }
    
    func popToRoot() {
        DispatchQueue.main.async { [self] in
            path.removeLast(path.count)
        }
    }
}
