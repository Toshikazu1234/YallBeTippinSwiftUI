//
//  Extensions.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import Foundation

extension Double {
    func toCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(from: NSNumber(value: self))!
    }
}
