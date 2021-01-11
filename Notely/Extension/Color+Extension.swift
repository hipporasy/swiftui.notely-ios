//
//  Color+Extension.swift
//  Notely
//
//  Created by Marasy Phi on 10/1/21.
//

import SwiftUI

extension Color {
    
    static let primaryColor = Color.init(hex: 0x6273ED)
    static let primaryBackground = Color.init(hex: 0xFBFCFF)
    static let secondaryColor = Color.init(hex: 0xF1F1F1)
    static let primaryRed = Color.init(hex: 0xFC6B6B)
    static let lightText = Color.init(hex: 0x343434)
    static let lightGrey = Color.init(hex: 0xF5F5F5)
    static let darkText = Color.init(hex: 0x535353)
    static let darkerText = Color.init(hex: 0x323232)
    static let primaryGreen = Color.init(hex: 0x4DC992)
    
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 08) & 0xff) / 255,
            blue: Double((hex >> 00) & 0xff) / 255,
            opacity: alpha
        )
    }
    
}
