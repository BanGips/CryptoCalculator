//
//  CalculatorModel.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 9.01.22.
//

import SwiftUI

class CalculatorModel: ObservableObject {
    
    @Published var entryPrice: Double?
    @Published var takeProfit: Double?
    @Published var stopLose: Double?
    @Published var leverage = 1.0
    
}


