//
//  MenuListVM.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import Foundation
import Observation

@Observable final class MenuListVM {
    var path: [Int] = []
    
    var items: [MenuItem] = [
        MenuItem(name: "Burger", price: 12.5, img: "burger"),
        MenuItem(name: "Chow mein", price: 13, img: "chowMein"),
        MenuItem(name: "Dumplings", price: 7, img: "dumplings"),
        MenuItem(name: "Fried chicken", price: 14.5, img: "friedChicken"),
        MenuItem(name: "Pizza", price: 6, img: "pizza"),
        MenuItem(name: "Spaghetti", price: 13.5, img: "spaghetti"),
        MenuItem(name: "Steak", price: 16, img: "steak"),
        MenuItem(name: "Sushi", price: 8, img: "sushi")
    ] {
        didSet {
            let sum = items.reduce(0, {
                $0 + ($1.price * Double($1.orderCount))
            })
            total = sum * tipPercentage.rawValue
            print("total: \(total)")
        }
    }
    
    var tipPercentage: TipPercentage = .none {
        didSet {
            total *= tipPercentage.rawValue
        }
    }
    
    var total: Double = 0
    
    var receipt: [any ReceiptItem] = []
    
    func calculate() {
        for i in items where i.orderCount > 0 {
            receipt.append(i)
        }
        let tip = FinalReceiptItem(
            title: "Tip",
            value: tipPercentage.toString())
        receipt.append(tip)
        
        let total = FinalReceiptItem(
            title: "Total",
            value: total.toCurrency())
        receipt.append(total)
    }
    
    func reset() {
        receipt = []
    }
}
