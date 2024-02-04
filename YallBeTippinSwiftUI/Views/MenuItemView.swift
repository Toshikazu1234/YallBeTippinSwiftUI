//
//  MenuItemView.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import SwiftUI

struct MenuItemView: View {    
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
            
            Image(item.img)
                .resizable()
                .scaledToFit()
                .cornerRadius(8)
                .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .frame(maxHeight: 100)
        .alert(isPresented: $presentAlert) {
            Alert(title: Text("Alert"), message: Text("Are you sure you want to remove this item?"), primaryButton: .destructive(Text("Remove"), action: {
                item.orderCount = 0
            }), secondaryButton: .cancel())
        }
    }
}

#Preview {
    MenuItemView(item: .constant(MenuItem(name: "Pizza", price: 6, img: "pizza", orderCount: 0)), showFullMenu: false)
        .previewLayout(.sizeThatFits)
}
