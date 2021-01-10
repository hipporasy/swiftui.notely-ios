//
//  Font+Extension.swift
//  Notely
//
//  Created by Marasy Phi on 10/1/21.
//

import SwiftUI

extension Font {
    
    private static let _fontName = "Metropolis"
    
    enum `Type` : String {
        case regular
        case semiBold
        case medium
        case black
        
        var fontName: String {
            return "\(_fontName)-\(self.rawValue.capitalized)"
        }
    }
    
    static func primary(type: `Type`, size: CGFloat = 15) -> Font {
        return .custom(type.fontName, size: size)
    }
    
    
}
