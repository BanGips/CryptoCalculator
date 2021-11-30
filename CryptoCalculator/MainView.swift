//
//  ContentView.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 27.11.21.
//

import SwiftUI

struct MainView: View {
    
    enum ViewToShow {
        case calculator, journal
    }
    
    @State private var viewToShow = ViewToShow.calculator
    
    var body: some View {
        TabView(selection: $viewToShow){
            CalculatorView()
                .tag(ViewToShow.calculator)
                .tabItem {
                    Image("calc")
                    Text("Journal")
                }
            
            JournalView()
                .tag(ViewToShow.journal)
                .tabItem {
                    Image("journal")
                    Text("Journal")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}
