//
//  ShoppingItemCellView.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import SwiftUI

struct ShoppingItemCellView: View {
    
    private let shoppingItem: ShoppingItem
    
    init(shoppingItem: ShoppingItem) {
        self.shoppingItem = shoppingItem
    }
    
    var body: some View {
        HStack(spacing: .zero) {
            Spacer()
                .frame(width: NumberConstants.leadingSpacer)
            VStack(alignment: .leading, spacing: .zero) {
                Spacer()
                Text(shoppingItem.name)
                    .bold()
                Text("\(Constants.amount): \(shoppingItem.amount.formattedString())")
                Spacer()
            }
            .frame(height: NumberConstants.cellHeight)
            Spacer()
        }
        .background(Color.grayishWhite)
        .cornerRadius(NumberConstants.cornerRadius)
    }
}
