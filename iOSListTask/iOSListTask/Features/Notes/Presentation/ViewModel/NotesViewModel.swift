//
//  NotesViewMoel.swift
//  iOSListTask
//
//  Created by Jahja Muratovic on 29. 1. 2024..
//

import Foundation
import Combine

final class NotesViewModel: ObservableObject {
    
    private let useCase: NotesUseCaseProtocol
    private var cancelBag = Set<AnyCancellable>()
    
    @Published var isLoading = false
    @Published var errorState = false
    @Published var errorMessage = String()
    
    init(
        useCase: NotesUseCaseProtocol = NotesUseCase()
    ) {
        self.useCase = useCase
    }
    
    
}

