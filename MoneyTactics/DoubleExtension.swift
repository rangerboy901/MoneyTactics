//
//  DoubleExtension.swift
//  MoneyTactics
//
//  Created by Joseph DeWeese on 4/2/22.
//

import Foundation


extension Double {
    var toCurrency: String {
       
        let currencyFormatter = NumberFormatter()
        currencyFormatter.usesGroupingSeparator = true
        
        currencyFormatter.maximumFractionDigits = 0
        currencyFormatter.numberStyle = .currency
        
        currencyFormatter.locale = Locale.current
        
        let priceString = currencyFormatter.string(from: NSNumber(value: self))!
        
        return priceString
        
    }
}
