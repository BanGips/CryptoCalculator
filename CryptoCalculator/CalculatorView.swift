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
                Color.indigo
                    .ignoresSafeArea()
            }
            .navigationTitle("Calculator")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "doc.badge.gearshape.fill")
                        .font(.title)
                        
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
