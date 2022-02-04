//
//  CalculatorModel.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 9.01.22.
//

import SwiftUI

class CalculatorModel: ObservableObject {
    
    @UserDefault(key: "CalculatorModel.deposit", defaultValue: 0)
    var deposit: Int
    
    @UserDefault(key: "CalculatorModel.riskPerTrade", defaultValue: 1)
    var riskPerTrade: Int
    
    @UserDefault(key: "CalculatorModel.leverage", defaultValue: 1.0)
    var leverage: Double {
        didSet {
            objectWillChange.send()
        }
    }
    
    @Published var entryPrice: Double?
    @Published var takeProfit: Double?
    @Published var stopLose: Double?
    @Published var long = true
    
    var entryAmount: Double {
        guard let entryPrice = entryPrice,
              let stopLose = stopLose
        else { return 0 }
        
        let movementPercentage: Double
        if long {
            movementPercentage = 100 / ((1 - stopLose / entryPrice) * leverage) * Double(riskPerTrade) / 100
        } else {
            movementPercentage = 100 / ((stopLose / entryPrice - 1) * leverage) * Double(riskPerTrade) / 100
        }
        
        return (Double(deposit) * movementPercentage) / 100
    }
    
    var amountOfRisk: Int {
        return deposit * riskPerTrade / 100
    }
    
    var profit: Double {
        guard let takeProfit = takeProfit,
              let entryPrice = entryPrice
        else { return 0 }
        
        let profit: Double
        if long {
            profit = (takeProfit / entryPrice - 1) * leverage * entryAmount
        } else {
            profit = (1 - takeProfit / entryPrice) * leverage * entryAmount
        }
        
        return profit
    }
    
    
    func saveSettings(deposit: Int, riskPerTrade: Int) {
        self.deposit = deposit
        self.riskPerTrade = riskPerTrade
        
        objectWillChange.send()
    }
}


