//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Wataru Oshima on 2025/06/08.
//

import SwiftUI

struct ContentView: View {
    @State private var number1 = ""
    @State private var number2 = ""
    @State private var result  = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("簡単なアプリ").font(.title)
            
            TextField("数値1を入力", text: $number1)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            TextField("数値2を入力", text: $number2)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button("計算する") {
                let n1 = Int(number1) ?? 0
                let n2 = Int(number2) ?? 0
                result = n1 + n2
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("結果: \(result)")
                .font(.title2)
                .padding()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
