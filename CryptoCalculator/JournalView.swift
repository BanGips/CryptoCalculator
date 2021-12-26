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
            List {
                DropDownItem()
            }
            .navigationTitle("Journal")
        }
        .navigationViewStyle(.stack)
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}


struct DropDownItem: View {
    
    @State private var expand = false
    
    var body: some View {
        DisclosureGroup(isExpanded: $expand) {
            Text("TO DO")
        } label: {
            Text("some text")
        }
        .padding()
        .background(Color.blue.cornerRadius(8))
    }
}

struct DropDownItem_Previews: PreviewProvider {
    static var previews: some View {
        DropDownItem()
    }
}
