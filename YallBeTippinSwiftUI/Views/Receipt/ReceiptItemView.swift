//
//  ReceiptItemView.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import SwiftUI

struct ReceiptItemView: View {
    let item: MenuItem
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            Text(item.name)
                .font(.title3)
            
            Spacer()
            
            Text("x\(item.orderCount)")
                .font(.title3)
            
            Text(item.total.toCurrency())
                .font(.title3)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    ReceiptItemView(item: MenuItem(name: "Pizza", price: 6, img: "pizza", orderCount: 1))
}
