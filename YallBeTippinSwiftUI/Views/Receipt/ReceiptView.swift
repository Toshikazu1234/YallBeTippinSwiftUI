//
//  ReceiptView.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import SwiftUI

struct ReceiptView: View {
    @Environment(MenuListVM.self) private var vm
    
    var body: some View {
        VStack(spacing: 0) {
            Text("Thank you!")
                .font(.largeTitle)
            
            List {
                ForEach(vm.receipt, id: \.id) {
                    ReceiptItemView(item: $0)
                }
                if let tip = vm.receiptTip {
                    ReceiptTotalView(item: tip)
                }
                if let total = vm.receiptTotal {
                    ReceiptTotalView(item: total)
                }
            }
            .listStyle(.plain)
        }
        .onAppear {
            vm.calculate()
        }
        .onDisappear {
            vm.reset()
        }
    }
}

#Preview {
    ReceiptView()
}
