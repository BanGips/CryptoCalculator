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
                    .font(.montserratBold(size: fontSize))
                
                Spacer()
                
                Text(price)
                    .font(.montserratBold(size: fontSize))
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

struct RoundedTextField: View {
    @Binding var text: Double?
    
    var body: some View {
        TextField("", value: $text, format: .currency(code: "USD"))
            .textFieldStyle(.rounded)
            .font(.montserratBold(size: 16))
            .keyboardType(.decimalPad)
    }
}

struct RoundedTextFieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .frame(height: 40)
            .padding(.horizontal)
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(.white, lineWidth: 1))
    }
}

extension TextFieldStyle where Self == RoundedTextFieldStyle {

    static var rounded: RoundedTextFieldStyle {
        return RoundedTextFieldStyle()
    }
}

struct TitleAndInfo: View {
    
    let text: String
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(text)
                    .font(.montserratBold(size: 16))
                Button {
                    
                } label: {
                    Image("fi-br-info")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.accentColor)
                }
            }
        }
    }
}

