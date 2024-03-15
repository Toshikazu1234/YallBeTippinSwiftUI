//
//  TipButton.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/28/24.
//

import SwiftUI

struct TipButton: View {
    @Environment(MenuListVM.self) private var vm
    let tip: TipPercentage
    
    var body: some View {
        Button {
            vm.tipPercentage = tip
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(tip == vm.tipPercentage ? Color.blue : Color.gray)
                
                Text(tip.toString())
                    .font(.largeTitle)
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    TipButton(tip: .small)
}

struct TipSelections {
    var tipPercentage: TipPercentage
    var isSelected: Bool
}
