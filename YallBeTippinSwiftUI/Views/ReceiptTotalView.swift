//
//  ReceiptTotalView.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import SwiftUI

struct ReceiptTotalView: View {
    let item: FinalReceiptItem
    
    var body: some View {
        HStack {
            Text(item.title)
                .font(.title3)
            
            Spacer()
            
            Text(item.value)
                .font(.title3)
        }
        .padding(.horizontal)
    }
}

#Preview {
    ReceiptTotalView(item: FinalReceiptItem(title: "Tip", value: "18%"))
}
