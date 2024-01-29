//
//  MenuItem.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import Foundation

struct MenuItem: ReceiptItem {
    let id = UUID().uuidString
    let name: String
    let price: Double
    let img: String
    var orderCount = 0
    
    var total: Double {
        return price * Double(orderCount)
    }
}
