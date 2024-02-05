//
//  ShoppingListRepositoryProtocol.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation
import Combine

protocol ShoppingListRepositoryProtocol {
    func fetchShoppingList() -> AnyPublisher<[ShoppingItem], Error>
    func delete(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error>
    func add(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error>
    func update(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error>
}
