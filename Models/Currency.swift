//
//  Currency.swift
//  miMake
//
//  Created by Jairus Pereira on 8/31/25.
//

import Foundation

enum Currency{
    private static let rupeeFormatter: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .currency
        f.currencyCode = "INR"
        f.maximumFractionDigits = 0
        f.locale = Locale(identifier: "en_IN")
        return f
    }()
    
    static func formatINR(_ amount: Int) -> String {
            rupeeFormatter.string(from: NSNumber(value: amount)) ?? "₹\(amount)"
    }
    }
    

