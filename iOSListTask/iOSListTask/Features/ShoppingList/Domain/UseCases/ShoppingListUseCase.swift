//
//  ShoppingListUseCase.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation
import Combine

final class ShoppingListUseCase: ShoppingListUseCaseProtocol {
    private lazy var remoteRepository: ShoppingListRepositoryProtocol = {
        ShoppingListRepository()
    }()
    
    func fetchShoppingList() -> AnyPublisher<[ShoppingItem], Error> {
        return remoteRepository.fetchShoppingList()
    }
    
    func delete(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error> {
        return remoteRepository.delete(item: item)
    }
    
    func add(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error> {
        return remoteRepository.add(item: item)
    }
    
    func update(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error> {
        return remoteRepository.update(item: item)
    }
}

