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
    @State private var result  = ""
    
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
            
            HStack {
                Button("+") {
                    calculate { $0 + $1 }
                }
                .buttonStyle()
                
                Button("-") {
                    calculate { $0 - $1 }
                }
                .buttonStyle()
            }
            
            HStack {
                Button("×") {
                    calculate { $0 * $1 }
                }
                .buttonStyle()
                
                Button("÷") {
                    calculate {
                        if $1 != 0 {
                            return $0 / $1
                        } else {
                            result = "エラー：0で割れません"
                            return nil
                        }
                    }
                }
                .buttonStyle()
            }
//
//            Button("計算する") {
//                let n1 = Int(number1) ?? 0
//                let n2 = Int(number2) ?? 0
//                result = n1 + n2
//            }
//            .padding()
//            .background(Color.blue)
//            .foregroundColor(.white)
//            .cornerRadius(10)
            
            Text("結果: \(result)")
                .font(.title2)
                .padding()
        }
        .padding()
    }
    
    private func calculate(_ operation: (Int, Int) -> Int?) {
        guard let n1 = Int(number1), let n2 = Int(number2) else {
            result = "数値を正しく入力してください"
            return
        }
        if let res = operation(n1, n2) {
            result = String(res)
        }
    }
}

extension Button {
    func buttonStyle() -> some View {
        self
            .frame(width: 60, height:  40)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
    }
}
#Preview {
    ContentView()
}
