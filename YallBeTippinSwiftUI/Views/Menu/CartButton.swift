//
//  CartButton.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 3/16/24.
//

import SwiftUI

struct CartButton: View {
    @Environment(MenuListVM.self) private var vm
    @Binding var showAlert: Bool
    
    var body: some View {
        @Bindable var vm = vm
        Button {
            if vm.total == 0 {
                showAlert = true
            } else {
                vm.path.append(.cart)
            }
        } label: {
            Image(systemName: "cart")
        }
        .alert("Your cart is empty!", isPresented: $showAlert) {
            Button("Dismiss") {}
        }
    }
}
