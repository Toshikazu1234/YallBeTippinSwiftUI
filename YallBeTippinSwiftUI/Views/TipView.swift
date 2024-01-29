//
//  TipView.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import SwiftUI

struct TipView: View {
    @Environment(MenuListVM.self) private var vm
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            TipButton(tip: .small)
            
            TipButton(tip: .medium)
            
            TipButton(tip: .large)
        }
        .padding(.horizontal)
        .navigationTitle("Just gonna ask a question")
        .toolbar {
            NavigationLink(destination: ReceiptView()) {
                Text("Confirm")
            }
        }
    }
}

#Preview {
    TipView()
}
