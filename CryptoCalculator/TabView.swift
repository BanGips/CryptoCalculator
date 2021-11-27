//
//  TabView.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 27.11.21.
//

import SwiftUI

struct TabView: View {
    
    @Binding var viewToShow: ViewToShow
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Button {
                    withAnimation(.linear(duration: 0.2)) {
                        viewToShow = .calculator
                    }
                } label: {
                    VStack {
                        Image(systemName: "plus.forwardslash.minus")
                            
                            .font(.title)
                        Text("Calculator")
                            .font(.subheadline)
                    }
                    .tint(viewToShow == .calculator ? .pink : .gray)
                }
                .scaleEffect(viewToShow == .calculator ? 1.2 : 1)
               
                Spacer()
                Button {
                    withAnimation(.linear(duration: 0.2)) {
                        viewToShow = .journal
                    }
                } label: {
                    VStack {
                        Image(systemName: "book.closed")
                            .font(.title)
                        Text("Journal")
                            .font(.subheadline)
                    }
                    .tint(viewToShow == .journal ? .pink : .gray)
                }
                .scaleEffect(viewToShow == .journal ? 1.2 : 1)
            }
            .padding(.horizontal, 60)
            .padding(.vertical)
            .background(Color.mint)
        }
    }
}


struct TabView_Previews: PreviewProvider {
    static var previews: some View {
        TabView(viewToShow: .constant(.calculator))
    }
}
