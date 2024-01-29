//
//  ReceiptItem.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import Foundation

protocol ReceiptItem: Identifiable {
    var anyHashableId: AnyHashable { get }
}

extension ReceiptItem {
    var anyHashableId: AnyHashable { AnyHashable(id) }
}

struct FinalReceiptItem: ReceiptItem {
    let id = UUID().uuidString
    let title: String
    let value: String
}
