//
//  ShoppingItem.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 27. 1. 2024..
//

import Foundation

struct ShoppingItem: Identifiable {
    let id: UUID = UUID()
    var name: String
    var amount: Double
    let creationDate: Date = Date()
}
