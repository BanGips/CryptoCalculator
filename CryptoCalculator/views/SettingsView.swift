//
//  SettingsView.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 2.02.22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var model: CalculatorModel
    
    @State private var deposit = 0
    @State private var riskPerTrade = 1
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Color(red: 20, green: 22, blue: 32).opacity(0.7)
                .gesture(DragGesture(minimumDistance: 10)
                    .onEnded { _ in
                        dismiss()
                    })
            
            Group {
                VStack(spacing: 30) {
                    Text("Settings")
                        .font(.montserratBold(size: 21))
                        .padding(.bottom, -10)
                    Text("Here you can set default parameters")
                    
                    VStack(alignment: .leading) {
                        TitleAndInfo(text: "DEPOSIT")
                        TextField("", value: $deposit, format: .currency(code: "USD"))
                            .font(.montserratBold(size: 16))
                            .textFieldStyle(.rounded)
                            .keyboardType(.numberPad)
                            .ignoresSafeArea(.keyboard, edges: .bottom)
                    }
                    
                    VStack(alignment: .leading) {
                        TitleAndInfo(text: "RISK PER TRADE")
                        TextField("", value: $riskPerTrade, format: .percent)
                            .font(.montserratBold(size: 16))
                            .textFieldStyle(.rounded)
                            .keyboardType(.numberPad)
                    }
                    
                    Button {
                        model.saveSettings(deposit: deposit, riskPerTrade: riskPerTrade)
                        dismiss()
                    } label: {
                        Text("SAVE")
                            .font(.montserratBold(size: 15))
                            .foregroundColor(.black)
                            .frame(height: 54)
                            .frame(maxWidth: .infinity)
                            .background(LinearGradient(colors: [
                                Color(red: 237, green: 182 , blue: 68),
                                Color(red: 234, green: 157, blue: 62)
                            ], startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(15)
                    }
                }
                .padding(.horizontal, 25)
                .padding(.vertical, 40)
            }
            .background(Color("nextBlack"))
            .cornerRadius(radius: 46, corners: [.topLeft, .topRight])
            .onAppear {
                deposit = model.deposit
                riskPerTrade = model.riskPerTrade
            }
        }
        .ignoresSafeArea(.container, edges: .bottom)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(model: CalculatorModel())
            .preferredColorScheme(.dark)
    }
}

struct ClearBackgroundView: UIViewRepresentable {
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    func updateUIView(_ uiView: UIViewType, context: Context) { }
}

struct ClearBackgroundViewModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .background(ClearBackgroundView())
    }
}

extension View {
    func clearModalBackground( )-> some View {
        self.modifier(ClearBackgroundViewModifier())
    }
}
