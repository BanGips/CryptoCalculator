//
//  ContentView.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 27.11.21.
//

import SwiftUI

enum ViewToShow {
    case calculator
    case journal
}


struct MainView: View {
    
    @State private var viewToShow = ViewToShow.calculator

    var body: some View {
        ZStack {
            fetchView(viewToShow)
            
            TabView(viewToShow: $viewToShow)
                .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    @ViewBuilder
    private func fetchView(_ viewToShow: ViewToShow) -> some View {
        switch viewToShow {
        case .calculator: CalculatorView()
        case .journal: JournalView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
