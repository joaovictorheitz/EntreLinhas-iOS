    //
    //  Coordinator.swift
    //  EntreLinhasIOS
    //
    //  Created by João Victor de Souza Guedes on 17/11/24.
    //

    import Foundation
    import SwiftUI

class Coordinator: ObservableObject {
    @Published var path: NavigationPath = NavigationPath()
    @Published var fullScreenCover: FullScreenCover?
    
    @ViewBuilder
    func build(page: AppPages) -> some View {
        switch page {
        case .main: MainView()
        case .login: LoginView()
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
        path.append(page)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}
