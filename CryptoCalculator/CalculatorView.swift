//
//  CalculatorView.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 27.11.21.
//

import SwiftUI

struct CalculatorView: View {
    @State var text = ""
    @State var text1 = ""
    @State var text2 = ""
    @State var text3 = ""
    @State var text4 = ""
    @State var text5 = ""
    @State var text6 = ""
    @State var text7 = ""
    
    
    var body: some View {
        NavigationView {
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
                Color("mainBlack")
                    .ignoresSafeArea()
                
                VStack {
                    VStack(spacing: 16) {
                        TitleAndPrice(text: "ENTRY AMOUNT", price: "125 $", fontSize: 20, priceColor: Color("orange"))
                        TitleAndPrice(text: "PROFIT", price: "25 $", fontSize: 16)
                        TitleAndPrice(text: "AMOUNT OF RISK", price: "125 $", fontSize: 16)
                    }
                    .padding(.horizontal, 22)
                    
                    Group {
                        ScrollView {
                            VStack(spacing: 30) {
                                HStack {
                                    ExtractedView()
                                    Spacer()
                                    ExtractedView()
                                    Spacer()
                                }
                                .padding(.horizontal)
                                
                                RoundedTextField(text: $text)
                                RoundedTextField(text: $text1)
                                RoundedTextField(text: $text2)
                                RoundedTextField(text: $text3)
                                RoundedTextField(text: $text4)
                                RoundedTextField(text: $text5)
                                RoundedTextField(text: $text6)
                                RoundedTextField(text: $text7)
                            }
                            
                            .padding(.horizontal, 22)
                        }
                        .padding(.top, 42)
                    }
                    .background(Color("nextBlack"))
                    .cornerRadius(radius: 46, corners: [.topLeft, .topRight])
                    .padding(.top, 34)
                    
                }
                .padding(.top, 63)
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

struct ExtractedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("DEPOSIT")
                    .font(Font.custom("Montserrat Bold", size: 16))
                Image("fi-br-info")
                    .resizable()
                    .frame(width: 15, height: 15)
                    .foregroundColor(.accentColor)
            }
            Text("1000 $")
                .font(Font.custom("Montserrat Bold", size: 18))
                .foregroundColor(Color("orange"))
        }
    }
}
