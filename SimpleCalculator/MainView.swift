//
//  MainView.swift
//  SimpleCalculator
//
//  Created by Wataru Oshima on 2025/06/08.
//

import SwiftUI

struct MainView: View {
    @State private var showMenu = false
    @State private var selectedView: MenuOption = .calculator
    
    var body: some View {
        ZStack {
            // 現在選択されているビュー
            Group {
                switch selectedView {
                case .calculator:
                    CalculatorView()
                case .settings:
                    SettingView()
                }
            }
            .disabled(showMenu)
            .blur(radius: showMenu ? 5: 0)
            
            VStack {
                HStack {
                    Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }) {
                        Image(systemName: "line.horizontal.3")
                            .font(.title)
                            .padding()
                    }
                    Spacer()
                }
                Spacer()
            }
            
            // メニュー画面
            if showMenu {
                SideMenuView(selectedView: $selectedView, showMenu: $showMenu)
            }
        }
    }
}
