//
//  ContentView.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 27. 1. 2024..
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ShoppingListView(viewModel: ShoppingListViewModel())
                .tabItem {
                    Label(Constants.shoppingList, systemImage: "checkmark.circle")
                }
            NotesView()
                .tabItem {
                    Label(Constants.notes, systemImage: "list.bullet.clipboard.fill")
                }
        }
    }
}

#Preview {
    MainView()
}
