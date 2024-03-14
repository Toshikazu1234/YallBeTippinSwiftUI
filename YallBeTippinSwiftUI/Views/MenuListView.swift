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
        if showFullMenu {
            List($vm.items) { $item in
                MenuItemView(item: $item, showFullMenu: showFullMenu)
                    .onTapGesture {
                        item.orderCount += 1
                    }
            }
            .navigationTitle("Menu")
            .navigationDestination(isPresented: $vm.canViewCart) {
                MenuListView(showFullMenu: false)
            }
            .toolbar {
                Button {
                    vm.canViewCart = vm.total > 0
                    if !vm.canViewCart {
                        showAlert = true
                    }
                } label: {
                    Image(systemName: "cart")
                }
            }
            .alert("Your cart is empty!", isPresented: $showAlert) {
                Button("Dismiss") {}
            }
        } else {
            List($vm.items, editActions: .delete) { $item in
                if item.orderCount > 0 {
                    MenuItemView(item: $item, showFullMenu: showFullMenu)
                        .onTapGesture {
                            item.orderCount += 1
                        }
                }
            }
            .navigationTitle("Cart")
            .toolbar {
                NavigationLink {
                    TipView()
                } label: {
                    Text("Submit")
                }
            }
        }
    }
}

#Preview {
    MenuListView(showFullMenu: true)
}
