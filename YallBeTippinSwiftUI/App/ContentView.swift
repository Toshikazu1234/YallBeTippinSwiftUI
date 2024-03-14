//
//  ContentView.swift
//  YallBeTippinSwiftUI
//
//  Created by R K on 1/26/24.
//

import SwiftUI

struct ContentView: View {
    @State private var vm = MenuListVM()
    
    var body: some View {
        NavigationStack(path: $vm.path) {
            MenuListView(showFullMenu: true)
                .navigationBarTitleDisplayMode(.inline)
        }
        .environment(vm)
    }
}

#Preview {
    ContentView()
}
