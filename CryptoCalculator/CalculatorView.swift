//
//  CalculatorView.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 27.11.21.
//

import SwiftUI

struct CalculatorView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color("mainBlack")
                    .ignoresSafeArea()
                Text("Heelo")
            }
            
                .navigationTitle("Calculator")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Image(systemName: "equal.square")
                            .font(.title)
                            .foregroundColor(.yellow)
                        Image(systemName: "equal.square")
                            .font(.title)
                            .foregroundColor(.yellow)
                    }
                }
                
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
