//
//  ContentView.swift
//  SimpleCalculator
//
//  Created by Wataru Oshima on 2025/06/08.
//

import SwiftUI

struct CalculatorView: View {
    @State private var number1 = ""
    @State private var number2 = ""
    @State private var result  = ""
    @State private var history: [String] = []
    
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
                    calculate(operation: +, symbol: "+")
                }
                .buttonStyle()
                
                Button("-") {
                    calculate(operation: -, symbol: "-")
                }
                .buttonStyle()
            }
            
            HStack {
                Button("×") {
                    calculate(operation: *, symbol: "×")
                }
                .buttonStyle()
                
                Button("÷") {
                    calculate(operation: { n1, n2 in
                        if n2 == 0 {
                            result = "エラー：0で割れません"
                            return nil
                        }
                        return n1 / n2
                    }, symbol: "÷")
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
            
            Button("リセット") {
                number1 = ""
                number2 = ""
                result = ""
                history.removeAll()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            Text("履歴:")
                .font(.headline)
            
            List(history.reversed(), id: \.self) { item in
                Text(item)
            }
            .frame(height: 200)
            
            Spacer()
        }
        .padding()
    }
    
    private func calculate(operation: (Int, Int) -> Int?, symbol: String) {
        guard let n1 = Int(number1), let n2 = Int(number2) else {
            result = "数値を正しく入力してください"
            return
        }
        
        guard let res = operation(n1, n2) else {
            return
        }
        
        result = String(res)
        history.append("\(n1) \(symbol) \(n2) = \(res)")
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
    CalculatorView()
}
