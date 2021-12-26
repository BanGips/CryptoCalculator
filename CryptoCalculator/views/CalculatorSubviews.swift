//
//  CalculatorSubviews.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 26.12.21.
//

import SwiftUI

struct Line: Shape {
    func path(in rect: CGRect) -> Path {
        let start = CGPoint(x: rect.minX, y: rect.midY)
        let end = CGPoint(x: rect.maxX, y: rect.midY)

        return Path { p in
            p.move(to: start)
            p.addLine(to: end)
        }
    }
}

struct TitleAndPrice: View {
    
    let text: String
    let price: String
    let fontSize: CGFloat
    var priceColor: Color?
    
    var body: some View {
        Group {
            HStack {
                Text(text)
                    .font(Font.custom("Montserrat Bold", size: fontSize))
                
                Spacer()
                
                Text(price)
                    .font(Font.custom("Montserrat Bold", size: fontSize))
                    .foregroundColor(priceColor ?? .white)
            }
            
            Line()
                .stroke(style: StrokeStyle(lineWidth: 1, dash: [4]))
                .frame(height: 1)
        }
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner

    struct CornerRadiusShape: Shape {
        var radius = CGFloat.zero
        var corners = UIRectCorner.allCorners

        func path(in rect: CGRect) -> Path {
            let path = UIBezierPath(roundedRect: rect,
                                    byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            return Path(path.cgPath)
        }
    }

    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        modifier(CornerRadiusStyle(radius: radius, corners: corners))
    }
}

struct RoundedTextField: View {
    
    @Binding var text: String
    
    struct RoundedTextFieldStyle: TextFieldStyle {
        
        func _body(configuration: TextField<Self._Label>) -> some View {
            configuration
                .frame(height: 45)
                .padding(.horizontal)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke(.white, lineWidth: 1))
        }
    }
    
    var body: some View {
        TextField("", text: $text)
            .textFieldStyle(RoundedTextFieldStyle())
            .font(Font.custom("Montserrat Bold", size: 16))
    }
}
