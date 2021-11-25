//
//  CryptoCalculatorApp.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 25.11.21.
//

import SwiftUI

@main
struct CryptoCalculatorApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
