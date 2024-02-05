//
//  ShoppingListViewModel.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation
import Combine

final class ShoppingListViewModel: ObservableObject {
    
    private let useCase: ShoppingListUseCaseProtocol
    private var cancelBag = Set<AnyCancellable>()
    private var sortToggled = false
    
    var changesPresent: Bool {
        if itemName != selectedItem?.name { return true }
        if amount != selectedItem?.amount { return true }
        return false
    }
    
    var hideDeleteButton: Bool {
        mode == .add
    }
    
    var areFieldsEmpty: Bool {
        if itemName.isEmpty { return true }
        if amount == .zero { return true }
        return false
    }
    
    @Published var shoppingList: [ShoppingItem] = []
    @Published var selectedItem: ShoppingItem? = nil
    {
        didSet {
            itemName = selectedItem?.name ?? String()
            amount = selectedItem?.amount ?? Double()
        }
    }
    @Published var itemName: String = String()
    @Published var amount: Double = Double()
    
    @Published var mode: ShoppingMode = .edit
    @Published var isLoading = false
    @Published var errorState = false
    @Published var errorMessage = String()
    
    init(
        useCase: ShoppingListUseCaseProtocol = ShoppingListUseCase()
    ) {
        self.useCase = useCase
    }
    
    func fetchShoppingList() {
        if shoppingList.isEmpty {
            isLoading = true
        }
        useCase.fetchShoppingList()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.handle(error: error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.isLoading = false
                self.shoppingList = value
            }
            .store(in: &cancelBag)
    }
    
    func add(item: ShoppingItem) {
        isLoading = true
        useCase.add(item: item)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.handle(error: error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.isLoading = false
                self.shoppingList.append(value)
            }
            .store(in: &cancelBag)
    }
    
    func delete() {
        if mode == .add { return }
        guard let selectedItem = selectedItem else { return }
        isLoading = true
        useCase.delete(item: selectedItem)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.handle(error: error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.isLoading = false
            }
            .store(in: &cancelBag)
    }
    
    func save() {
        guard var editedItem = selectedItem else { return }
        if !changesPresent { return }
        editedItem.name = itemName
        editedItem.amount = amount
        isLoading = true
        useCase.update(item: editedItem)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.handle(error: error)
                case .finished:
                    break
                }
            } receiveValue: { [weak self] value in
                guard let self = self else { return }
                self.isLoading = false
            }
            .store(in: &cancelBag)
    }
    
    private func handle(error: Error) {
        errorMessage = error.localizedDescription
        errorState = true
        isLoading = false
    }
    
    private func sortByNamesAsc() {
        shoppingList.sort { $0.name < $1.name }
    }
    
    private func sortByIdsDesc() {
         shoppingList.sort { $0.id > $1.id }
    }
    
    private func sortList() {
        sortToggled ? sortByNamesAsc() : sortByIdsDesc()
    }
}
