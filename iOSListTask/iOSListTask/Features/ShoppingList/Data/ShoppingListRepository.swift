//
//  ShoppingListRepository.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation
import Combine

final class ShoppingListRepository: ShoppingListRepositoryProtocol {
    func fetchShoppingList() -> AnyPublisher<[ShoppingItem], Error> {
        return DataSingleton.shared.giveShoppingList().eraseToAnyPublisher()
    }
    
    func delete(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error> {
        return DataSingleton.shared.deleteItem(item: item).eraseToAnyPublisher()
    }
    
    func add(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error> {
        return DataSingleton.shared.addItem(item: item)
    }
    
    func update(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error> {
        return DataSingleton.shared.updateItem(item: item)
    }
}
