//
//  Extensions.swift
//  CryptoCalculator
//
//  Created by Sergei Kastyukovets on 26.12.21.
//

import SwiftUI

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
