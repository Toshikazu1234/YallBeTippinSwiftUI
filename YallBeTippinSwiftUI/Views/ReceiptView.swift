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
            
            List(vm.receipt, id: \.anyHashableId) { item in
                if let item = item as? MenuItem {
                    ReceiptItemView(item: item)
                } else if let item = item as? FinalReceiptItem {
                    ReceiptTotalView(item: item)
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
