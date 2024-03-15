//
//  MenuItemView.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import SwiftUI

struct MenuItemView: View {    
    @Environment(MenuListVM.self) private var vm
    @Binding var item: MenuItem
    let showFullMenu: Bool
    @State private var presentAlert: Bool = false
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 15) {
                Text(item.name)
                    .font(.title2)
                    .fontWeight(.medium)
                
                Text("\(item.price.toCurrency())")
                    .font(.title3)
            }
            
            Spacer()
            
            if showFullMenu {
                if item.orderCount > 0 {
                    MenuButtonsView(item: $item, showFullMenu: showFullMenu, presentAlert: $presentAlert)
                }
            } else {
                MenuButtonsView(item: $item, showFullMenu: showFullMenu, presentAlert: $presentAlert)
            }
            
            Image(item.img)
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .frame(maxHeight: 100)
        .onTapGesture {
            item.orderCount += 1
        }
        .alert(isPresented: $presentAlert) {
            Alert(title: Text("Alert"), message: Text("Are you sure you want to remove this item?"), primaryButton: .destructive(Text("Remove"), action: {
                item.orderCount = 0
                if !vm.items.contains(where: {
                    $0.orderCount > 0
                }) && !showFullMenu {
                    vm.path.removeLast()
                }
            }), secondaryButton: .cancel())
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MenuItemView(item: .constant(MenuItem(name: "Pizza", price: 6, img: "pizza", orderCount: 0)), showFullMenu: false)
        .previewLayout(.sizeThatFits)
}
