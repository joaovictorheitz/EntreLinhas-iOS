//
//  MainView.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    @StateObject private var viewModel: MainViewModel = MainViewModel()
    
    var body: some View {
        TabView(selection: $viewModel.tabSelection) {
            Tab(
                EntreLinhasIOSStrings.mainViewButtonHomeTitle,
                systemImage: "house.fill",
                value: 0
            ) {
                HomeView()
            }
            
            Tab(
                EntreLinhasIOSStrings.mainViewButtonServicesTitle,
                systemImage: "briefcase.fill",
                value: 1
            ) {
                ServicesView()
            }
                    
            Tab(
                EntreLinhasIOSStrings.mainViewButtonActivitiesTitle,
                systemImage: "app.fill",
                value: 2
            ) {
                ActivitiesView()
            }
            
            Tab(
                EntreLinhasIOSStrings.mainViewButtonAccountTitle,
                systemImage: "person.fill",
                value: 3
            ) {
                AccountView()
            }
        }
        .navigationBarBackButtonHidden(true)
        .tint(.white)
        .onAppear {
            viewModel.onAppear(coordinator: coordinator)
            
            setupTabBarAppearance()
        }
    }
    
    private func setupTabBarAppearance() {
        setTabBarBackground()
        setTabBarUnselectedItemTintColor()
    }
    
    private func setTabBarBackground() {
        UITabBar.appearance().backgroundColor = EntreLinhasIOSAsset.Assets.caribbeanCurrent.color
    }
    
    private func setTabBarUnselectedItemTintColor() {
        UITabBar.appearance().unselectedItemTintColor = EntreLinhasIOSAsset.Assets.ashGray.color
    }
}

#Preview {
    MainView()
}
