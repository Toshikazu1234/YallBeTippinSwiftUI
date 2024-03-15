//
//  MenuButtonsView.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 3/14/24.
//

import SwiftUI

struct MenuButtonsView: View {
    @Binding var item: MenuItem
    let showFullMenu: Bool
    @Binding var presentAlert: Bool
    
    var body: some View {
        VStack(alignment: .center, spacing: 5) {
            Button {
                item.orderCount += 1
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                    
                    Image(systemName: "plus")
                        .symbolRenderingMode(.monochrome)
                        .foregroundStyle(.white)
                }
            }
            .buttonStyle(.borderless)
            
            Text("\(item.orderCount)")
                .font(.title2)
            
            Button {
                guard item.orderCount > 0 else { return }
                if !showFullMenu && item.orderCount == 1 {
                    presentAlert = true
                } else {
                    item.orderCount -= 1
                }
            } label: {
                ZStack {
                    Circle()
                        .fill(Color.blue)
                    
                    Image(systemName: "minus")
                        .symbolRenderingMode(.monochrome)
                        .foregroundStyle(.white)
                }
            }
            .buttonStyle(.borderless)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    MenuButtonsView(item: .constant(MenuItem(name: "Pizza", price: 6, img: "pizza", orderCount: 0)), showFullMenu: false, presentAlert: .constant(true))
}
