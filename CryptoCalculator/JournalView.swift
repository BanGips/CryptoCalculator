//
//  JournalView.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 27.11.21.
//

import SwiftUI

struct JournalView: View {
    var body: some View {
        NavigationView {
            Color.secondary
                .ignoresSafeArea()
            
                .navigationTitle("Journal")
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
