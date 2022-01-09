//
//  CalculatorView.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 27.11.21.
//

import SwiftUI

struct CalculatorView: View {
    
    @StateObject var model = CalculatorModel()
    
    @FocusState private var amountIsFocused: Bool
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                Color("mainBlack")
                    .ignoresSafeArea()
                
                VStack {
                    VStack(spacing: 10) {
                        TitleAndPrice(text: "ENTRY AMOUNT", price: "125 $", fontSize: 20, priceColor: Color("orange"))
                        TitleAndPrice(text: "PROFIT", price: "25 $", fontSize: 16)
                        TitleAndPrice(text: "AMOUNT OF RISK", price: "125 $", fontSize: 16)
                    }
                    .padding(.horizontal, 22)
                    
                    Group {
                        ScrollView {
                            VStack(alignment: .leading, spacing: 20) {
                                HStack {
                                    VStack(alignment: .leading) {
                                        TitleAndInfo(text: "DEPOST")
                                        Text("1000 $")
                                            .font(.montserratBold(size: 18))
                                            .foregroundColor(Color("orange"))
                                            .underline()
                                    }
                                    
                                    Spacer()
                                    
                                    VStack(alignment: .leading) {
                                        TitleAndInfo(text: "RISK %")
                                        Text("3")
                                            .font(.montserratBold(size: 18))
                                            .foregroundColor(Color("orange"))
                                            .underline()
                                    }
                                    Spacer()
                                }
                                
                                HStack {
                                    Button {
                                        
                                    } label: {
                                        Text("LONG")
                                            .font(.montserratBold(size: 16))
                                            .foregroundColor(Color("green"))
                                            .frame(width: 150 ,height: 32)
                                            .overlay(RoundedRectangle(cornerRadius: 3)
                                                        .stroke(Color("green"), lineWidth: 1))
                                    }
                                    
                                    Spacer()
                                    
                                    Button {
                                        
                                    } label: {
                                        Text("SHORT")
                                            .font(.montserratBold(size: 16))
                                            .foregroundColor(.white)
                                            .frame(width: 150 ,height: 32)
                                            .overlay(RoundedRectangle(cornerRadius: 3)
                                                        .stroke(.white, lineWidth: 1))
                                    }
                                }
                                
                                TitleAndInfo(text: "LEVERAGE")
                                    .padding(.top, 10)
                                
                                HStack {
                                    VStack {
                                        Slider(value: $model.leverage, in: 1...100, step: 1)
                                        HStack {
                                            Text("1")
                                                .font(.montserratBold(size: 14))
                                            Spacer()
                                            Text("100")
                                                .font(.montserratBold(size: 14))
                                        }
                                    }
                                    
                                    Text(Int(model.leverage).description)
                                        .font(.montserratBold(size: 22))
                                        .foregroundColor(Color("orange"))
                                        .underline()
                                        .offset(y: -10)
                                        .frame(width: 40, height: 32)
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
                        .padding(.top, 20)
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
                        //                        TO DO
                    } label: {
                        Image("fi-br-settings")
                            .resizable()
                            .frame(width: 28, height: 28)
                            .foregroundColor(.accentColor)
                    }
                }
                ToolbarItem.init(placement: .keyboard) {
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
