//
//  Extensions.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 26.12.21.
//

import SwiftUI
import Foundation

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        modifier(CornerRadiusStyle(radius: radius, corners: corners))
    }
}

extension Font {
    static func montserratBold(size: CGFloat) -> Font {
        return Font.custom("Montserrat Bold", size: size)
    }
}

extension Double {
    var addedDollarSign: String {
        return String(format: "%.2f $", self)
    }
}

extension Int {
    var addedDollarSign: String {
        return String(format: "%d $", self)
    }
}

extension Color {
    init(red: Int, green: Int, blue: Int) {
        self.init(red: Double(red) / 255, green: Double(green) / 255, blue: Double(blue) / 255)
    }
}
