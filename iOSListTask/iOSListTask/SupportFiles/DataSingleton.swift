//
//  DataSingleton.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation
import Combine

class DataSingleton {
    private let banana = ShoppingItem(name: "Banana", amount: 3.5)
    private let kiwi = ShoppingItem(name: "Kiwi", amount: 4.5)
    private let bread = ShoppingItem(name: "Bread", amount: 1.0)
    
    private var shoppingList: [ShoppingItem] = []
    let shoppingListGenerator = PassthroughSubject<[ShoppingItem], Error>()
    let shoppingItemGenerator = PassthroughSubject<ShoppingItem, Error>()
    
    private var notesList: [NoteItem] = []
    
    
    static let shared = DataSingleton() // The singleton holder
    
    private init() {
        self.shoppingList = [banana, kiwi, bread]
        self.notesList = [
            NoteItem(
                title: "First Note",
                note: "Lorem IPSUM",
                shoppingItems: [banana.id])
        ]
    }
    
    func sayHello() {
        print("Hello!")
    }

    func add(note: NoteItem) {
        notesList.append(note)
    }
    
    func delete(note: NoteItem) {
        notesList.removeAll(where: {
            $0.id == note.id
        })
    }
    
    func giveShoppingList() -> AnyPublisher<[ShoppingItem], Error> {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.shoppingListGenerator.send(self.shoppingList)
        }
        return shoppingListGenerator.eraseToAnyPublisher()
    }
    
    func deleteItem(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error> {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.shoppingItemGenerator.send(item)
        }
        self.shoppingList.removeAll(where: {
            $0.id == item.id
        })
        return shoppingItemGenerator.eraseToAnyPublisher()
    }
    
    func addItem(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error> {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.shoppingItemGenerator.send(item)
        }
        return shoppingItemGenerator.eraseToAnyPublisher()
    }
    
    func updateItem(item: ShoppingItem) -> AnyPublisher<ShoppingItem, Error> {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.shoppingItemGenerator.send(item)
        }
        self.shoppingList.removeAll(where: {
            $0.id == item.id
        })
        self.shoppingList.append(item)
        return shoppingItemGenerator.eraseToAnyPublisher()
    }
}
