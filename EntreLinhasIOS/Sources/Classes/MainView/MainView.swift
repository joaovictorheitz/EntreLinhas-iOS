//
//  MainView.swift
//  EntreLinhasIOS
//
//  Created by João Victor de Souza Guedes on 16/11/24.
//

import SwiftUI

struct MainView: View {
    @State var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            Tab(
                "Home",
                systemImage: "house.fill",
                value: 0
            ) {
                HomeView()
            }
            
            Tab(
                "Services",
                systemImage: "briefcase.fill",
                value: 1
            ) {
                ServicesView()
            }
                    
            Tab(
                "Activities",
                systemImage: "app.fill",
                value: 2
            ) {
                ActivitiesView()
            }
            
            Tab(
                "Account",
                systemImage: "person.fill",
                value: 3
            ) {
                AccountView()
            }
        }
        .tint(.white)
        .onAppear() {
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
