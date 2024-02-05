//
//  ListView.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 27. 1. 2024..
//

import SwiftUI

struct ShoppingListView: View {
    
    @StateObject var viewModel: ShoppingListViewModel
    @State var showDetails = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView(showsIndicators: false) {
                    ForEach(viewModel.shoppingList) { item in
                        Button(action: {
                            edit(item: item)
                        }, label: {
                            ShoppingItemCellView(shoppingItem: item)
                                .padding(.horizontal)
                        }).buttonStyle(.plain)
                        
                    }
                    Spacer()
                        .frame(height: 210)
                }
                addButton
                Spacer(minLength: 10)
            }
            .onAppear {
                viewModel.fetchShoppingList()
            }
            .navigationDestination(isPresented: $showDetails) {
                ShoppingItemDetailView(viewModel: viewModel)
            }
            .overlay(conditionalLoaderView)
        }
    }
    
    var addButton: some View {
        Button(action: {
            addItem()
        }, label: {
            HStack {
                Spacer()
                Text(Constants.add)
                Spacer()
            }
            .frame(height: NumberConstants.cellHeight)
            .background(Color.grayishWhite)
            .cornerRadius(NumberConstants.cornerRadius)
            .padding(.horizontal)
        })
    }
    
    func edit(item: ShoppingItem) {
        viewModel.selectedItem = item
        viewModel.mode = .edit
        showDetails = true
    }
    
    func addItem() {
        viewModel.selectedItem = ShoppingItem(name: String(), amount: Double())
        viewModel.mode = .add
        showDetails = true
    }
    
    var conditionalLoaderView: some View {
        ProgressView()
            .scaleEffect(1.5)
            .progressViewStyle(CircularProgressViewStyle(tint: .blue))
            .opacity(viewModel.isLoading ? 1.0 : .zero)
    }
}

#Preview {
    ShoppingListView(viewModel: ShoppingListViewModel())
}
