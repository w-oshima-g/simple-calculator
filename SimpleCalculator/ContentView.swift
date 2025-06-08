//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Wataru Oshima on 2025/06/08.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {
                Text("メニュー")
                    .font(.largeTitle)
                
                NavigationLink("計算アプリを開く") {
                    CalculatorView()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
