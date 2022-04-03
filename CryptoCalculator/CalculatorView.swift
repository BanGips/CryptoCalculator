//
//  CalculatorView.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 27.11.21.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject private var model = CalculatorModel()
    
    @FocusState private var amountIsFocused: Bool
    @State private var isShowingSettings = false
    
    private var longColor: Color {
        return model.long ? Color("green") : .white
    }
    
    private var shortColor: Color {
        return !model.long ? Color("red") : .white
    }

    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                Color("mainBlack")
                    .ignoresSafeArea()
                
                VStack {
                    VStack(spacing: 10) {
                        TitleAndPrice(text: "ENTRY AMOUNT",
                                      price: model.entryAmount.addedDollarSign,
                                      fontSize: 20,
                                      priceColor: Color("orange"))
                        TitleAndPrice(text: "PROFIT",
                                      price: model.profit.addedDollarSign,
                                      fontSize: 16)
                        TitleAndPrice(text: "AMOUNT OF RISK",
                                      price: model.amountOfRisk.addedDollarSign,
                                      fontSize: 16)
                    }
                    .padding(.horizontal, 22)
                    
                    Group {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 20) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        TitleAndInfo(text: "DEPOSIT")
                                        Text(model.deposit.addedDollarSign)
                                            .font(.montserratBold(size: 18))
                                            .foregroundColor(Color("orange"))
                                            .underline()
                                            .onTapGesture {
                                                isShowingSettings.toggle()
                                            }
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading) {
                                        TitleAndInfo(text: "RISK %")
                                        Text(model.riskPerTrade.addedDollarSign)
                                            .font(.montserratBold(size: 18))
                                            .foregroundColor(Color("orange"))
                                            .underline()
                                            .onTapGesture {
                                                isShowingSettings.toggle()
                                            }
                                    }
                                    .offset(x: -70)
                                }
                                
                                HStack {
                                    Button {
                                        model.long = true
                                    } label: {
                                        Text("LONG")
                                            .font(.montserratBold(size: 16))
                                            .foregroundColor(longColor)
                                            .frame(width: 150 ,height: 32)
                                            .overlay(RoundedRectangle(cornerRadius: 3)
                                                        .stroke(longColor, lineWidth: 1))
                                    }
                                    
                                    Spacer()
                                    
                                    Button {
                                        model.long = false
                                    } label: {
                                        Text("SHORT")
                                            .font(.montserratBold(size: 16))
                                            .foregroundColor(shortColor)
                                            .frame(width: 150 ,height: 32)
                                            .overlay(RoundedRectangle(cornerRadius: 3)
                                                        .stroke(shortColor, lineWidth: 1))
                                    }
                                }
                                
                                TitleAndInfo(text: "LEVERAGE")
                                    .padding(.top, 10)
                                
                                HStack {
                                    VStack {
                                        Slider(value: .init(get: {
                                            model.leverage
                                        }, set: {
                                            model.leverage = $0
                                        }), in: 1...50, step: 1)
                                        
                                        HStack {
                                            Text("1")
                                                .font(.montserratBold(size: 14))
                                            Spacer()
                                            Text("50")
                                                .font(.montserratBold(size: 14))
                                        }
                                    }
                                    
                                    Text(Int(model.leverage).description)
                                        .font(.montserratBold(size: 24))
                                        .foregroundColor(Color("orange"))
                                        .offset(y: -10)
                                        .frame(width: 45, height: 32)
                                        .padding()
                                }
                                
                                VStack(alignment: .leading) {
                                    TitleAndInfo(text: "ENTRY PRICE")
                                    RoundedTextField(text: $model.entryPrice)
                                        .focused($amountIsFocused)
                                }
                                
                                VStack(alignment: .leading) {
                                    TitleAndInfo(text: "TAKE PROFIT")
                                    RoundedTextField(text: $model.takeProfit)
                                        .focused($amountIsFocused)
                                }
                                
                                VStack(alignment: .leading) {
                                    TitleAndInfo(text: "STOP LOSE")
                                    RoundedTextField(text: $model.stopLose)
                                        .focused($amountIsFocused)
                                }
                            }
                            .padding(.horizontal, 22)
                            .padding(.bottom, 5)
                        }
                        .padding(.top, 35)
                    }
                    .background(Color("nextBlack"))
                    .cornerRadius(radius: 46, corners: [.topLeft, .topRight])
                    .padding(.top, 10)
                }
                .padding(.top, 20)
            }
            .navigationTitle("Calculator")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        //                        TO DO
                    } label: {
                        Image("fi-br-info")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.accentColor)
                    }
                    
                    Button {
                        isShowingSettings.toggle()
                    } label: {
                        Image("fi-br-settings")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.accentColor)
                    }.fullScreenCover(isPresented: $isShowingSettings) {
                        SettingsView(model: model)
                            .clearModalBackground()
                            .focused($amountIsFocused)
                    }
                }
                
                ToolbarItem(placement: .keyboard) {
                    HStack {
                        Spacer()
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
            .preferredColorScheme(.dark)
    }
}
