//
//  ContentView.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 27.11.21.
//

import SwiftUI

struct MainView: View {
    
    enum ViewToShow {
        case calculator
        case journal
    }
    
    @State private var viewToShow = ViewToShow.calculator

    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $viewToShow){
                CalculatorView()
                    .tag(ViewToShow.calculator)
                
                JournalView()
                    .tag(ViewToShow.journal)
            }
            
            HStack(spacing: 0) {
                Button {
                    withAnimation {
                        viewToShow = .calculator
                    }
                } label: {
                    Image(systemName: "plusminus")
                        .font(.title)
                        .tint(viewToShow == .calculator ? .red : .black)
                }
                .scaleEffect(viewToShow == .calculator ? 1.3 : 1)
                
                Spacer()
                
                Button {
                    withAnimation {
                        viewToShow = .journal
                    }
                } label: {
                    Image(systemName: "book.fill")
                        .font(.title)
                        .tint(viewToShow == .journal ? .red : .black )
                }
                .scaleEffect(viewToShow == .journal ? 1.3 : 1)
            }
            .padding(.horizontal, 70)
            .padding(.vertical)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
