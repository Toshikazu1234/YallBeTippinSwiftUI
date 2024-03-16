//
//  MenuListView.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import SwiftUI
import Observation

struct MenuListView: View {
    @Environment(MenuListVM.self) private var vm
    let showFullMenu: Bool
    @State private var showAlert = false
    
    var body: some View {
        @Bindable var vm = vm
        List($vm.items) { $item in
            if showFullMenu {
                MenuItemView(item: $item, showFullMenu: showFullMenu)
            } else if item.orderCount > 0 {
                MenuItemView(item: $item, showFullMenu: showFullMenu)
            }
        }
        .navigationTitle(showFullMenu ? "Menu" : "Cart")
        .navigationDestination(for: MenuListVM.Screen.self) { screen in
            if screen == .cart {
                MenuListView(showFullMenu: false)
            } else if screen == .tip {
                TipView()
            }
        }
        .toolbar {
            if showFullMenu {
                Button {
                    if vm.total == 0 {
                        showAlert = true
                    } else {
                        vm.path.append(.cart)
                    }
                } label: {
                    Image(systemName: "cart")
                }
            } else {
                Button("Submit") {
                    vm.path.append(.tip)
                }
            }
        }
        .alert("Your cart is empty!", isPresented: $showAlert) {
            Button("Dismiss") {}
        }
    }
}

#Preview {
    MenuListView(showFullMenu: true)
}
